//
//  PVSCollapsibleNavigationController.swift
//  TestBarButtonItems
//
//  Created by Paul Von Schrottky on 4/3/15.
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
    func pvs_collapsibleBar() {
        self.topViewController.navigationItem.titleView = customTitleLabel
        customTitleLabel.font = UIFont.boldSystemFontOfSize(20)
        customTitleLabel.text = "Hello, mundo!"
        customTitleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraint(NSLayoutConstraint(item: customTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: customTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.navigationBar, attribute: .CenterY, multiplier: 1.0, constant: 0))
    }
    
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
            self.navigationBar.tintColor = self.navigationBar.tintColor.colorWithAlphaComponent(1)
        } else if yOffset < shrinkBy {
            currentNavigationBarHeight = defaultNavigationBarHeight - yOffset
            customTitleLabel.font = customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (yOffset / 3))
            self.navigationBar.tintColor = self.navigationBar.tintColor.colorWithAlphaComponent(1 - (yOffset / shrinkBy))
        } else {
            currentNavigationBarHeight = defaultNavigationBarHeight - shrinkBy
            customTitleLabel.font = customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (shrinkBy / 3))
            self.navigationBar.tintColor = self.navigationBar.tintColor.colorWithAlphaComponent(0)
        }
        if let constraint = navBarTitleHeightConstraint {
            constraint.constant = CGFloat(currentNavigationBarHeight)
        }
        self.navigationBar.sizeToFit()
    }
}
