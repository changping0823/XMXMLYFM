//
//  XMNetwrorkTool.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Alamofire

enum XMRequestType: Int {
    case GET
    case POST
}

class XMNetwrorkTool: NSObject {
    static let shareInstance : XMNetwrorkTool = {
        let tools = XMNetwrorkTool()
        return tools
    }()
}


extension XMNetwrorkTool {
    func xm_requestData(methodType:XMRequestType,urlString : String, parameters:[String : AnyObject]?,finished:@escaping(_ result: AnyObject?,_ error:NSError?) ->()){
        
        let resultCallBack = {(response: DataResponse<Any>) in
            if response.result.isSuccess {
                finished(response.result.value as AnyObject?,nil)
            }else{
                finished(nil, response.result.error as NSError?)
            }
        }
        // 2.请求数据
        let httpMethod: HTTPMethod = methodType == .GET ? .get : .post
        request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: resultCallBack)
    }
}


