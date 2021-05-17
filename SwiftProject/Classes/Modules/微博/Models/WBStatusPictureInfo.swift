//
//  WBStatusPictureInfo.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

class WBStatusPictureInfo: NSObject {
    
    @objc var thumbnail_pic : String?
    
    init(dic:[String: AnyObject]) {
        super.init()
        
        setValuesForKeys(dic)
    }
    
    override class func setValue(_ value: Any?, forKey key: String) {
        
    }
    
}
