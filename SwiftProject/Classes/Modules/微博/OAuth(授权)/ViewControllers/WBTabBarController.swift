//
//  WBTabBarController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/6.
//

import UIKit

class WBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        let homeNav = self.navigationController(viewController: WBHomeViewController(), title: "微博", image: "home")
        self.addChild(homeNav)
        
        let listenNav = self.navigationController(viewController: ListenViewController(), title: "视频号", image: "favor")
        self.addChild(listenNav)
        
        let playNav = self.navigationController(viewController: PlayViewController(), title: "发现", image: "play")
        self.addChild(playNav)
        
        let findNav = self.navigationController(viewController: FindViewController(), title: "消息", image: "find")
        self.addChild(findNav)
        
        let mineNav = self.navigationController(viewController: FindViewController(), title: "我", image: "me")
        self.addChild(mineNav)
        
        tabBar.tintColor = UIColor.orange
    }
    
    func navigationController(viewController:BaseViewController, title: String, image:String) -> BaseViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: "tabbar_\(image)_normal")
        viewController.tabBarItem.selectedImage = UIImage(named: "tabbar_\(image)_selected")
        return viewController
    }


}
