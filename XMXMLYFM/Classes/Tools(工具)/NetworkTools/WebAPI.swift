//
//  WebAPI.swift
//  XMXMLYFM
//
//  Created by Charles on 2020/11/7.
//  Copyright © 2020 任长平. All rights reserved.
//

import Foundation
import Moya

/// 定义基础域名
let Moya_baseURL = "http://mobile.ximalaya.com/mobile/"

enum WebAPI{
    
    case homeTabs //获取图片列表
    case getPhotoList//获取图片列表
    case updateAPi(parameters:[String:Any])
    case register(email:String,password:String)
    case uploadHeadImage(parameters: [String:Any],imageDate:Data)//上传用户头像
}



extension WebAPI :TargetType {
    var baseURL: URL {
        switch self {
        case .getPhotoList:
            return URL.init(string:(Moya_baseURL))!
            
        case .homeTabs:
            return URL.init(string:(Moya_baseURL))!
        default:
            return URL.init(string:(Moya_baseURL))!
        }
    }
    
    var path: String {
        
        switch self {
        case .homeTabs:
            return "discovery/v2/tabs?device=iPhone&version=5.4.57"
            
        case .getPhotoList:
            return "v2/channels/104/items?ad=2&gender=2&generation=2&limit=20&offset=0"
            
        case .register:
            return "register"
            
        case .updateAPi:
            return "versionService.getAppUpdateApi"
            
        case .uploadHeadImage:
            return "/file/user/upload.jhtml"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhotoList:
            return .get
        default:
            return .post
        }
    }
    
    //    这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    //    该条请API求的方式,把参数之类的传进来
    var task: Task {
        //        return .requestParameters(parameters: nil, encoding: JSONArrayEncoding.default)
        switch self {
        
        case .getPhotoList:
            return .requestPlain
            
        case .homeTabs:
            return .requestPlain
            
        case let .register(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
            
        case let .updateAPi(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        //图片上传
        case .uploadHeadImage(let parameters, let imageDate):
            ///name 和fileName 看后台怎么说，   mineType根据文件类型上百度查对应的mineType
            let formData = MultipartFormData(provider: .data(imageDate), name: "file",
                                             fileName: "hangge.png", mimeType: "image/png")
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
            
        //可选参数https://github.com/Moya/Moya/blob/master/docs_CN/Examples/OptionalParameters.md
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
}
