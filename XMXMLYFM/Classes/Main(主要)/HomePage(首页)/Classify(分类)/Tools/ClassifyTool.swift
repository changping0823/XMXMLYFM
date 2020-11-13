//
//  ClassifyTool.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2017/7/13.
//  Copyright © 2017年 任长平. All rights reserved.
//

import UIKit


fileprivate let kAnchorRecommendAPI = "http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?categoryId=2&device=iPhone&statEvent=pageview%2Fcategory%40%E9%9F%B3%E4%B9%90&statModule=%E9%9F%B3%E4%B9%90&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB"

class ClassifyTool: NSObject {

    class func requestClassifyCategory(categoryId:Int, _ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        let url = "http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?categoryId="+String(categoryId)+"&device=iPhone&statEvent=pageview%2Fcategory%40%E9%9F%B3%E4%B9%90&statModule=%E9%9F%B3%E4%B9%90&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB"
        
//        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .POST, urlString: url, parameters: nil) { (result, error) in
//            finished(result, error)
//        }
    }

}
