//
//  UINavigationBar+Extension.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/29.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

private var kBackgroundViewKey = "kBackgroundViewKey"
private var kStatusBarMaskKey  = "kStatusBarMaskKey"


//private var overlayKey: UInt8 = 0
//private var emptyImageKey: UInt8 = 0

extension UINavigationBar{


    public var showShadow : Bool{
        get{
            return self.showShadow
        }
        set{
            if !newValue {
                self.shadowImage = UIImage()
            }else{
                self.shadowImage = UIImage().creatImageWithColor(color: RGBA(r: 205, g: 205, b: 205, a: 0.7))
            }
        }
    }
        
    
    public func xm_setBackgroundColor(_ color: UIColor) {
        if backgroundView == nil {
            setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            shadowImage = UIImage()
            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 64))
            backgroundView?.isUserInteractionEnabled = false
            backgroundView?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            insertSubview(backgroundView!, at: 0)
        }
        backgroundView?.backgroundColor = color

    }

    
    // MARK: Properties
    fileprivate var backgroundView:UIView? {
        get {
            return objc_getAssociatedObject(self, &kBackgroundViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kBackgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
        }
    }
    fileprivate var statusBarMask:UIView? {
        get {
            return objc_getAssociatedObject(self, &kStatusBarMaskKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kStatusBarMaskKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    

}
