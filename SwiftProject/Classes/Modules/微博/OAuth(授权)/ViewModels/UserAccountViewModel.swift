//
//  UserAccountViewModel.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/30.
//

import UIKit

class UserAccountViewModel: NSObject {
    static let shareUserAccount: UserAccountViewModel = UserAccountViewModel()
    
    var userAccount: Account {
        return Account.accoun()
    }
    
    /// 判断是否登录
    var isLogin: Bool {
        return !accessToken.isEmpty
    }
    
    var accessToken: String{
        guard let token = userAccount.access_token else {
            return String()
        }
        
        let result = userAccount.expires_time?.compare(NSDate() as Date)
        if result == ComparisonResult.orderedDescending {
            return token
        }
        return String()
    }
    
    
}
