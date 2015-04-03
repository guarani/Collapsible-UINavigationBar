//
//  TestViewController.swift
//  TestShrinkingNavBar
//
//  Created by Paul Von Schrottky on 4/1/15.
//  Copyright (c) 2015 Paul Von Schrottky. All rights reserved.
//

import UIKit

var defaultNavigationBarHeight: CGFloat = 44.0
var currentNavigationBarHeight = defaultNavigationBarHeight
let defaultNavigationBarTitleFontSize: CGFloat = 20.0
let shrinkBy: CGFloat = 25.0


import ObjectiveC

// Declare a global var to produce a unique address as the assoc object handle
var AssociatedObjectHandle: UInt8 = 0

extension UIViewController {
    var stringProperty:String {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
}


extension UINavigationBar {
    public override func sizeThatFits(size: CGSize) -> CGSize {
        return CGSizeMake(self.superview!.frame.size.width, currentNavigationBarHeight)
    }
}

//// Declare a global var to produce a unique address as the assoc object handle
//var AssociatedObjectHandle: UInt8 = 0
//
//extension UIViewController {
//    var stringProperty:String {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as String
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }
//}

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    var navBarTitleHeightConstraint: NSLayoutConstraint!
    let customTitleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultNavigationBarHeight = self.navigationController!.navigationBar.frame.size.height
    
        
        self.customTitleLabel.text = "Hello, mundo!"
        self.customTitleLabel.font = UIFont.boldSystemFontOfSize(defaultNavigationBarTitleFontSize)
        self.navigationItem.titleView = self.customTitleLabel
        self.customTitleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
//        self.customTitleLabel.backgroundColor = UIColor.greenColor()
        self.navBarTitleHeightConstraint = NSLayoutConstraint(item: self.customTitleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: CGFloat(defaultNavigationBarHeight))
        self.navigationController!.view.addConstraint(self.navBarTitleHeightConstraint)
        self.navigationController?.view.addConstraint(NSLayoutConstraint(item: self.customTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.navigationController?.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.navigationController?.view.addConstraint(NSLayoutConstraint(item: self.customTitleLabel, attribute: .Top, relatedBy: .Equal, toItem: self.navigationController!.navigationBar, attribute: .Top, multiplier: 1.0, constant: 0))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#pragma - mark UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel!.text = String(indexPath.row)
        return tableViewCell
    }

    //#pragma - mark UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   
    }
    
    //#pragma - mark UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let statusBarSize = UIApplication.sharedApplication().statusBarFrame.size
        let statusBarHeight = min(statusBarSize.width, statusBarSize.height)
        println("statusBarHeight: \(statusBarHeight)")
        
        var yOffset = scrollView.contentOffset.y
        if self.automaticallyAdjustsScrollViewInsets {
            yOffset += statusBarHeight
            yOffset += self.navigationController!.navigationBar.frame.size.height
        }
        println("navBarHeight: \(self.navigationController!.navigationBar.frame.size.height)")
        println("yOffset: \(yOffset)")
        
        if yOffset < 0 {
            self.customTitleLabel.font = self.customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize)
            currentNavigationBarHeight = defaultNavigationBarHeight
        } else if yOffset < shrinkBy {
            currentNavigationBarHeight = defaultNavigationBarHeight - yOffset
            self.customTitleLabel.font = self.customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (yOffset / 4))
        } else {
            currentNavigationBarHeight = defaultNavigationBarHeight - shrinkBy
            self.customTitleLabel.font = self.customTitleLabel.font.fontWithSize(defaultNavigationBarTitleFontSize - (shrinkBy / 4))
        }
        self.navBarTitleHeightConstraint.constant = CGFloat(currentNavigationBarHeight)
        self.navigationController?.navigationBar.sizeToFit()
    }
}

