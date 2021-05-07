//
//  Account.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/29.
//

import UIKit

class WBAccount: NSObject,NSCoding {
    /** string     用于调用access_token，接口获取授权后的access token。*/
    @objc var access_token: String?
    //  access_token的生命周期，单位是秒数。
    @objc var expires_in: TimeInterval = 0 {
        didSet {
            //  过期时间 = 获取accesstoken那一刻起的时间 + 过期秒数
            //  dateByAddingTimeInterval函数的意思在当前时间的基础加上多少秒
            expiresDate = NSDate().addingTimeInterval(expires_in)
            
        }
    }
    
    //  过期时间
    @objc var expiresDate: NSDate?
    
    ///  授权用户的UID
    @objc var uid: Int64 = 0
    /**
     *  用户昵称
     */
    @objc var name: String?
    
    //  头像
    @objc var avatar_large: String?
    
    

    
    /// 归档
    func encode(with aCoder:NSCoder) {
        aCoder.encode(access_token,forKey: "access_token")
//        aCoder.encode(expires_in,forKey: "expires_in")
        aCoder.encode(expiresDate,forKey: "expiresDate")
        aCoder.encode(uid,forKey: "uid")
        aCoder.encode(name,forKey: "name")
        aCoder.encode(avatar_large,forKey: "avatar_large")
    }
    /// 解档
    required init(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expiresDate = aDecoder.decodeObject(forKey: "expiresDate") as? NSDate
//        expires_time = aDecoder.decodeInt64(forKey: "expires_time")
        uid = aDecoder.decodeInt64(forKey: "uid")
        name = aDecoder.decodeObject(forKey: "name") as? String
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
    }
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    //  防止字段不匹配,导致崩溃
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    //  重写description
    override var description: String {
        
        let keys = ["access_token", "expires_in", "uid", "name", "avatar_large"]
        
        return dictionaryWithValues(forKeys: keys).description
    }
    
    /// 保存用户信息
    func saveAccount() {
        
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archive")
        NSKeyedArchiver.archiveRootObject(self, toFile: path)
    }
    
    /// 获取用户信息
    class func account () -> WBAccount? {
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString).appendingPathComponent("userAccount.archive")
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as? WBAccount
        
    }
}
