//
//  WBUser.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import KakaJSON

///  关注微博用户的模型
class WBUser: Convertible {
    //  用户id
   @objc var id: Int64 = 0
    //  用户昵称
   @objc var screen_name: String?
    //  用户的头像
   @objc var profile_image_url: String?
    //  认证类型等级 -1 没有认证 ，0 认证用户，2，3，5 企业认证 ， 220 达人
   @objc var verified_type: Int = 0
    //  会员等级 1-6
   @objc var mbrank: Int = 0
    //  kvc构造函数
//    init(dic: [String: AnyObject]) {
//        super.init()
//        setValuesForKeys(dic)
//    }
//
//    //  防止字段不匹配,导致崩溃
//
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//
//    }
    
    
    required init() {}

    
}
