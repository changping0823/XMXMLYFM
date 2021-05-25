//
//  UIBarButtonItem-Extension.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageNamed : String, highlightedImage : String = "", size : CGSize = CGSize.zero ,_ target: Any?, action: Selector) {
        // 1.创建UIButton
        let btn = UIButton()
        btn.setImage(UIImage(named: imageNamed), for: .normal)
        if highlightedImage != "" {
            btn.setImage(UIImage(named: highlightedImage), for: .highlighted)
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView:btn)
    }
}
