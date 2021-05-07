//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
//        window?.rootViewController = OAuthViewController()
        //根视图是登录页面
        let tabbar = BaseTabBarController()
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()

        return true
    }




}

