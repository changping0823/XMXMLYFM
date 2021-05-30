//
//  EmojiManager.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/30.
//

import UIKit

class EmojiManager: NSObject {
    
    static let shared : EmojiManager = EmojiManager()
    
    var emojiPackages = [EmojiPackage]()
    
//    var <#name#> = <#value#>
    
    override init() {
        super.init()
        guard let path = Bundle.main.path(forResource: "emojiPackage.plist", ofType: nil, inDirectory: "Emoji.bundle") else {
            print("没有找到表情包")
            return
        }
        guard let dict = NSDictionary(contentsOfFile: path) as? [String:Any] else {
            print("没有找到表情包")
            return
        }
        
        guard let array = dict["packages"] as? [[String : String]] else {
            return
        }
        for package  in array {
           emojiPackages.append(EmojiPackage(dict: package))
        }

    }
    
    override class func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
