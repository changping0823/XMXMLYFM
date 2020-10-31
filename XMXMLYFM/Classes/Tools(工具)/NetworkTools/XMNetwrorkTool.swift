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
        
    }
}


