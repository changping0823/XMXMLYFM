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
        
        let homeNav = self.navigationController(viewController: HomeViewController(), title: "首页", image: "home")
        self.addChild(homeNav)
        
        let listenNav = self.navigationController(viewController: ListenViewController(), title: "我听", image: "favor")
        self.addChild(listenNav)
        
        let playNav = self.navigationController(viewController: PlayViewController(), title: "播放", image: "play")
        self.addChild(playNav)
        
        let findNav = self.navigationController(viewController: FindViewController(), title: "发现", image: "find")
        self.addChild(findNav)
        
        let mineNav = self.navigationController(viewController: FindViewController(), title: "我的", image: "me")
        self.addChild(mineNav)
        
        tabBar.tintColor = UIColor.orange
    }
    
    func navigationController(viewController:BaseViewController, title: String, image:String) -> BaseNavigationController {
        let nav = BaseNavigationController.init(rootViewController: viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: "tabbar_\(image)_normal")
        nav.tabBarItem.selectedImage = UIImage(named: "tabbar_\(image)_selected")
        return nav
    }


}
