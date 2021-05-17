//
//  WBStatus.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

class WBStatus: NSObject {
    //  发微博时间
   @objc var created_at: String?
    //  微博id
   @objc var id: Int64 = 0
    //  微博内容
   @objc var text: String?
    //  来源
   @objc var source: String?
    //  处理后的来源数据
   @objc var sourceContent: String?
    //  关注用户的模型
//   @objc var user: WBUser?
    //  转发数
   @objc var reposts_count: Int = 0
    //  评论数
   @objc var comments_count:    Int = 0
    //    表态数
   @objc var attitudes_count: Int = 0
    
    //  转发微博对象
   @objc var retweeted_status: WBStatus?
    //  匹配信息
   @objc var pic_urls: [WBStatusPictureInfo]?
    
    
    
    //  kvc构造函数
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    //这个方法写了必须调用super.setValue(value, forKey: key), 不写的话 系统会默认执行 setValue(_ value: Any?, forKey key: String)
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "source" {
            sourceContent = handleSource(source: value as! String)
        }
        
        if key == "user" {
            guard let dic = value as? [String: AnyObject] else {
                return
            }
            
            //  代码到此,字典没有问题
//            user = WBUser(dic: dic)
        }else if key == "retweeted_status" {
            guard let dic = value as? [String: AnyObject] else {
                return
            }
            
            //  代码执行到此,字典没有问题
            retweeted_status = WBStatus(dic: dic)
            
        } else if key == "pic_urls" {
            guard let dicArray = value as? [[String: AnyObject]] else {
                return
            }
            
            //  代码执行到此,数组字典没有问题
            var tempArray = [WBStatusPictureInfo]()
            for dic in dicArray {
                let pictureInfo = WBStatusPictureInfo(dic: dic)
                tempArray.append(pictureInfo)
            }
            //  设置模型数据
            pic_urls = tempArray
            
            
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    private func handleSource(source:String) -> (String){
        if source.contains("\">") && source.contains("</") {
            //  开始光标位置
            // \"> 这个字符串在我们整体字符串source里的范围 下面同理
            let startIndex = source.range(of: "\">")!.upperBound //光标在 \">| 最前面 | 表示光标
            //  结束光标位置
            let endIndex = source.range(of: "</")!.lowerBound //光标在 |</ 最后面  | 表示光标
            
            //  获取指定范围的字符串
            let result = source[source.index(startIndex, offsetBy: 0)..<source.index(endIndex, offsetBy: 0)];
            //  设置给来源数据
            return "来自: " + result
        }
        return ""
    }
    //  防止字段不匹配,导致崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
