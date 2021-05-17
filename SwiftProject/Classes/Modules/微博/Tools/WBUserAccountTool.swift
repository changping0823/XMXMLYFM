//
//  UserAccountTool.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/29.
//

import UIKit

class WBUserAccountTool: NSObject {
    static let shareUserAccount: WBUserAccountTool = WBUserAccountTool()

    var userAccount: WBAccount? {
        return WBAccount.account()
    }
    
    /// 判断是否登录
    var isLogin: Bool {
        return accessToken != nil
    }
    
    var accessToken: String?{
        //  判断accesstoken是否为nil
        
        guard let token = userAccount?.access_token else {
            return nil
        }
        
        //  如果accesstoken不为nil,判断accesstoken的时间是否过期
        let result =  userAccount?.expiresDate?.compare(NSDate() as Date)
        //  如果是降序表示accesstoken没有过期
        if result == ComparisonResult.orderedDescending {
            return token
        } else {
            return nil
        }
    }
    
}
