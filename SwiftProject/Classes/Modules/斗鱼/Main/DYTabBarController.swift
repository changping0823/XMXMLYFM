//
//  DYTabBarController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit

class DYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationController(viewController: DYHomeViewController(), title: "首页", image: "home")
        navigationController(viewController: DYLiveViewController(), title: "直播", image: "column")
        navigationController(viewController: DYFollowViewController(), title: "关注", image: "live")
        navigationController(viewController: DYProfileViewController(), title: "我的", image: "user")

        tabBar.tintColor = UIColor.orange
    }

    func navigationController(viewController:UIViewController, title: String, image:String){
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: "btn_\(image)_normal")
        viewController.tabBarItem.selectedImage = UIImage(named: "btn_\(image)_selected")
        self.addChild(DYNavigationController(rootViewController: viewController))
    }
}
