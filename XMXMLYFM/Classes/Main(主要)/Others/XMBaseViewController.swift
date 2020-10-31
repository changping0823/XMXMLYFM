//
//  XMBaseViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class XMBaseViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
        self.showBackButton(show: true)
        
    }
    
    open func showBackButton(show:Bool) {
        if show {
            var image = UIImage(named:"icon_back_h")
//            image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
//            image = image?.renderingMode
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:image,style: UIBarButtonItem.Style.done,target: self,action:#selector(backBarButtonItemClick))
        }else{
            let image = UIImage(named:"")
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:image,style: UIBarButtonItem.Style.done,target: nil,action:nil)
        }
    }
    
    
    
    
    @objc func backBarButtonItemClick() {
        if (self.navigationController?.topViewController == self) {
            self.navigationController?.popViewController(animated: true)
        }
        if self.presentingViewController != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
