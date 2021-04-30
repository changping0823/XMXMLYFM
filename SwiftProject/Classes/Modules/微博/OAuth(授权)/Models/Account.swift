//
//  Account.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/29.
//

import UIKit

class Account: NSObject {
    /** string     用于调用access_token，接口获取授权后的access token。*/
    var access_token: String?
    /** string     access_token的生命周期，单位是秒数。*/
    var expires_in: String?
    /** 过期时间 */
    var expires_time: NSDate?
    /** string     当前授权用户的UID。*/
    var uid: String?
    /**
     *  用户昵称
     */
    var name: String?
    
    //  头像
    var avatar_large: String?
    
    //  类函数
//    class func loadUserAccount() -> SUPUserAccount?{
//        //  设置保存路径
//        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archive")
//        SUPLog(path)
//        //  执行解档
//        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as? SUPUserAccount
//    }
    
    /// 归档
    func encode(with aCoder:NSCoder) {
        aCoder.encode(access_token,forKey: "access_token")
        aCoder.encode(expires_time,forKey: "expires_time")
        aCoder.encode(uid,forKey: "uid")
        aCoder.encode(name,forKey: "name")
        aCoder.encode(avatar_large,forKey: "avatar_large")
    }
    /// 解档
    init(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_time = aDecoder.decodeObject(forKey: "access_token") as? NSDate
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
    }
    
    /// 保存用户信息
    func saveAccount() {
        
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archive")
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
    }
    
    /// 获取用户信息
    class func accoun () -> Account {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archive")
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as! Account
        
    }
}
