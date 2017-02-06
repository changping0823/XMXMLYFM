//
//  XMPlayViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class XMPlayViewController: XMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func pop (){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
