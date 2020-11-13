//
//  BaseTabBarController.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeNav = BaseNavigationController.init(rootViewController: HomeViewController())
        homeNav.tabBarItem.title = "首页"
        self.addChild(homeNav)
        
        let mineNav = BaseNavigationController.init(rootViewController: MineViewController())
        mineNav.tabBarItem.title = "我的"
        self.addChild(mineNav)
    }
    


}
