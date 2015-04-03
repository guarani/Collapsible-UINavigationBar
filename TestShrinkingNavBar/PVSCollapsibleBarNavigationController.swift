//
//  PVSCollapsibleBarNavigationController.swift
//  TestShrinkingNavBar
//
//  Created by Paul Von Schrottky on 4/2/15.
//  Copyright (c) 2015 Paul Von Schrottky. All rights reserved.
//

import UIKit

// These are the variables that configure the navigation bar.
// Change these to suit your needs.
private var defaultNavigationBarHeight: CGFloat = 44.0
private var currentNavigationBarHeight = defaultNavigationBarHeight
private let defaultNavigationBarTitleFontSize: CGFloat = 20.0
private let shrinkBy: CGFloat = 25.0  // The amount that the navigation bar height shrinks.

// Other globals.
private let customTitleLabel = UILabel()
private var navBarTitleHeightConstraint: NSLayoutConstraint!

extension UINavigationBar {
    
    public override func sizeThatFits(size: CGSize) -> CGSize {
        return CGSizeMake(self.superview!.frame.size.width, currentNavigationBarHeight)
    }
}

extension UINavigationController {
    func pvs_collapisbleBarScrollViewDidScroll(scrollView: UIScrollView) {
        let statusBarSize = UIApplication.sharedApplication().statusBarFrame.size
        let statusBarHeight = min(statusBarSize.width, statusBarSize.height)

        var yOffset = scrollView.contentOffset.y
        if self.topViewController.automaticallyAdjustsScrollViewInsets {
            yOffset += statusBarHeight
            yOffset += self.navigationBar.frame.size.height
        }
        println("yOffset: \(yOffset)")

        if yOffset < 0 {
            customTitleLabel.font = customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize)
            currentNavigationBarHeight = defaultNavigationBarHeight
        } else if yOffset < shrinkBy {
            currentNavigationBarHeight = defaultNavigationBarHeight - yOffset
            customTitleLabel.font = customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (yOffset / 3))
        } else {
            currentNavigationBarHeight = defaultNavigationBarHeight - shrinkBy
            customTitleLabel.font = customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (shrinkBy / 3))
        }
        if let constraint = navBarTitleHeightConstraint {
            constraint.constant = CGFloat(currentNavigationBarHeight)
        }
        self.navigationBar.sizeToFit()
    }
}

class PVSCollapsibleBarNavigationController: UINavigationController {
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Do any additional setup after loading the view, typically from a nib.
        defaultNavigationBarHeight = self.navigationBar.frame.size.height
        
        customTitleLabel.text = "Hello, mundo!"
        customTitleLabel.font = UIFont.boldSystemFontOfSize(defaultNavigationBarTitleFontSize)
        self.topViewController.navigationItem.titleView = customTitleLabel
        customTitleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        navBarTitleHeightConstraint = NSLayoutConstraint(item: customTitleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: CGFloat(defaultNavigationBarHeight))
        self.view.addConstraint(navBarTitleHeightConstraint)
        self.view.addConstraint(NSLayoutConstraint(item: customTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: customTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: self.navigationBar, attribute: .Top, multiplier: 1.0, constant: 0))
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
}
