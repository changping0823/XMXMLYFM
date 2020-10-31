//
//  Common.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

/// 状态栏高度
let statusHeight = UIApplication.shared.statusBarFrame.height

/// 根据状态栏高度判断是否为异形屏
let isAlien : Bool = statusHeight > 0
/// 底部安全区域高度
let safeAreaBottom : CGFloat = isAlien ? 34:0

let tabBarHeight : CGFloat = 49


// 屏幕宽度
let XMScreenHeight = UIScreen.main.bounds.height
// 屏幕高度
let XMScreenWidth  = UIScreen.main.bounds.width

/// 屏幕宽高比（宽/高）
let XMScreenScale = XMScreenWidth/XMScreenHeight

// 导航条高度
let XMNavHeight : CGFloat = 64


let RandomColor = UIColor.init(red:CGFloat(arc4random_uniform(255))/CGFloat(255.0),
                             green:CGFloat(arc4random_uniform(255))/CGFloat(255.0),
                              blue:CGFloat(arc4random_uniform(255))/CGFloat(255.0) , alpha: 1)


// MARK:- 颜色方法
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

let MAIN_COLOR : UIColor = RGBA(r: 240, g: 100, b: 80, a: 1)






