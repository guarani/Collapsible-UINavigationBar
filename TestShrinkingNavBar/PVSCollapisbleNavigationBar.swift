//
//  PVSCollapisbleNavigationBar.swift
//  TestShrinkingNavBar
//
//  Created by Paul Von Schrottky on 4/1/15.
//  Copyright (c) 2015 Paul Von Schrottky. All rights reserved.
//

//import Foundation
//import UIKit
//import ObjectiveC


//var defaultNavigationBarHeightAssociatedObjectHandle: UInt8 = 0
//var currentNavigationBarHeightAssociatedObjectHandle: UInt8 = 0
//var defaultNavigationBarTitleFontSizeAssociatedObjectHandle: UInt8 = 0
//var shrinkByAssociatedObjectHandle: UInt8 = 0
//
//var defaultNavigationBarHeight: CGFloat = 44.0
//var currentNavigationBarHeight = defaultNavigationBarHeight
//let defaultNavigationBarTitleFontSize: CGFloat = 20.0
//let shrinkBy: CGFloat = 25.0

// Declare a global var to produce a unique address as the assoc object handle
//var AssociatedObjectHandle: UInt8 = 0

//extension UIViewController {

//    public override func sizeThatFits(size: CGSize) -> CGSize {
//        return CGSizeMake(self.superview!.frame.size.width, currentNavigationBarHeight)
//    }
    
//    var stringProperty:String {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as String
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }
    
//    var defaultNavigationBarHeight: CGFloat {
//        get {
//            return objc_getAssociatedObject(self, &defaultNavigationBarHeightAssociatedObjectHandle) as CGFloat
//        }
//        set {
//            objc_setAssociatedObject(self, &defaultNavigationBarHeightAssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }

    
//    var currentNavigationBarHeight: CGFloat {
//        get {
//            return objc_getAssociatedObject(self, &currentNavigationBarHeightAssociatedObjectHandle) as CGFloat
//        }
//        set {
//            objc_setAssociatedObject(self, &currentNavigationBarHeightAssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }
//    
//    var defaultNavigationBarTitleFontSize: CGFloat {
//        get {
//            return objc_getAssociatedObject(self, &defaultNavigationBarTitleFontSizeAssociatedObjectHandle) as CGFloat
//        }
//        set {
//            objc_setAssociatedObject(self, &defaultNavigationBarTitleFontSizeAssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }
//    
//    var shrinkBy: CGFloat {
//        get {
//            return objc_getAssociatedObject(self, &shrinkByAssociatedObjectHandle) as CGFloat
//        }
//        set {
//            objc_setAssociatedObject(self, &shrinkByAssociatedObjectHandle, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//        }
//    }
//}