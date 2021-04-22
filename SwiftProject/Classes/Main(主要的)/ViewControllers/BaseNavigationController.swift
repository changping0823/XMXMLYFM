//
//  BaseNavigationController.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    var barHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.delegate = self
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }else{
            viewController.hidesBottomBarWhenPushed = false
        }
        super .pushViewController(viewController, animated: animated)
    }

    
}

extension BaseNavigationController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //如果控制器遵守了DLNoNav协议，则需要隐藏导航栏
//        let noNav = [[viewController class] conformsToProtocol:@protocol(DLNoNav)];
//        let noNav = viewController.conforms(to: DLNoNav)
        
        //隐藏导航栏后会导致边缘右滑返回的手势失效，需要重新设置一下这个代理
        self.interactivePopGestureRecognizer?.delegate = self;
        
        //设置控制器是否要隐藏导航栏
//        [self setNavigationBarHidden:noNav animated:YES];
        self.setNavigationBarHidden(self.barHidden, animated: true)
    }
}
