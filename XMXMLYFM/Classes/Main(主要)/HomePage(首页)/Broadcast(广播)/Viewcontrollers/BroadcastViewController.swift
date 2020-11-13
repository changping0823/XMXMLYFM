//
//  BroadcastViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class BroadcastViewController: HomeListBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = UILabel()
        title.frame = CGRect(x:10,y:200,width:200,height:60)
        title.text = "BroadcastViewController"
        title.backgroundColor = UIColor.brown
        self.view .addSubview(title);
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
