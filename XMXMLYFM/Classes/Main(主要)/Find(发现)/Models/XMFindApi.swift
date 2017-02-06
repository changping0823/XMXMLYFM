//
//  XMFindApi.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit


// MARK:- 发现API
/// 主播
fileprivate let kFindAPI = "http://mobile.ximalaya.com/mobile/discovery/v1/square/list?cityCode=43_310000_3100&device=iPhone&version=5.4.57"

class XMFindApi: NSObject {
    /// 获取首页标题
    class func requestFind(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kFindAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
}






