//
//  Comment.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/17.
//

import KakaJSON

class Status: Convertible {
    //  发微博时间
   let created_at: String = ""
    //  微博id
   let id: Int64 = 0
    //  微博内容
   let text: String = ""
    //  来源
   let source: String = ""
    //  处理后的来源数据
   let sourceContent: String = ""
    //  关注用户的模型
   let user: WBUser! = nil
    //  转发数
   let reposts_count: Int = 0
    //  评论数
   let comments_count:    Int = 0
    //    表态数
   let attitudes_count: Int = 0
    
    //  转发微博对象
   let retweeted_status: Status? = nil
    //  匹配信息
//   let pic_urls: [WBStatusPictureInfo]?
    
    
    required init() {}
}
