//
//  WBBaseViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/6.
//

import UIKit

class WBBaseViewController: BaseViewController {
    //  是否登录的标记
   var isLogin:Bool = WBUserAccountViewModel.shareUserAccount.isLogin
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
