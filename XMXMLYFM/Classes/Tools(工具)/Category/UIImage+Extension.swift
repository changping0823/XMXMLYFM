//
//  UIImage+Extension.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/29.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

extension UIImage {
    
    func creatImageWithColor(color:UIColor)->UIImage{
//        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:1.0)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()!
//        context.setFillColor(color.cgColor)
//        context.fill(rect)
//        let image = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
        
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor);
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return theImage
    }
    
//    func creatImageWithColor(color: UIColor) -> UIImage {
//        let drawRect = CGRect(x:0.0, y:0.0, width:size.width, height:size.height)
//        UIGraphicsBeginImageContextWithOptions(size, false, scale)
//        color.setFill()
//        UIRectFill(drawRect)
//        draw(in: drawRect, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
//        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return tintedImage!
//    }
    
}
