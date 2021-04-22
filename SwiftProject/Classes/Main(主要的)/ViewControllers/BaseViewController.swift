//
//  BaseViewController.swift
//  SwiftProject
//
//  Created by ren on 2020/11/10.
//

import UIKit

class BaseViewController: ViewController,UINavigationControllerDelegate {
    
    var navigationAlpha: CGFloat?{
        didSet{
            //设置导航栏背景为空图片
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.withColor(color: UIColor.red.withAlphaComponent(self.navigationAlpha ?? 1.0)), for: .default)
            
            
        }
    }
    
    var navigationBarHidden: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationBarHidden = false
        self.navigationController?.delegate = self
//        //设置导航栏背景为空图片
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage.withColor(color: UIColor.white), for: .default)
//        //设置导航栏阴影为空图片
//        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.navigationController?.isNavigationBarHidden = self.navigationBarHidden
    }
    
}


//extension UINavigationControllerDelegate{
//
//}



