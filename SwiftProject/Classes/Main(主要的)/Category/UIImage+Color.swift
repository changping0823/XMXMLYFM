//
//  UIImage+Color.swift
//  SwiftProject
//
//  Created by Charles on 2020/11/16.
//

import UIKit

extension UIImage{
    /// 将颜色转换为图片
    class func withColor(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
