//
//  ClassifyDetailViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2017/7/13.
//  Copyright © 2017年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class ClassifyDetailViewController: UIViewController {

    var pageView:XMPageView!
    var categoryArray : [Categories]?
    
    
    var categoryId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.pageView = XMPageView.init(frame: CGRect(x:0,y:XMNavHeight,width:XMScreenWidth,height:XMToolBarH))
        self.pageView.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.pageView)
        
//self.pageView.t
        
        ClassifyTool.requestClassifyCategory(categoryId: categoryId) { (result, error) in
            
            let jsonString = result.toJSONValue()
//            self.categoryArray = JSONDeserializer<Categories>.deserializeModelArrayFrom(json: HandyJSON.toJSONValue(result as! HandyJSON))
////            self.categoryArray = JSONDeserializer<Categories>.deserializeFrom(json: JSON(result).description)

        }

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
