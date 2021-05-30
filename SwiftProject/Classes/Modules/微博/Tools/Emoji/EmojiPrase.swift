//
//  EmojiPrase.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/30.
//

import UIKit

class EmojiPrase: NSObject {

   static func emojiAttr(emojiText : String, font : UIFont) -> NSMutableAttributedString? {
        //将emojiText转换成富文本
        // 1234[哈哈] ,将哈哈解析出来
        let pattern = "\\[.*?\\]"
        guard let regular = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        
        let attr = NSMutableAttributedString(string: emojiText)
//    attr.
        
        let results = regular.matches(in: emojiText, options: [], range: NSRange(location: 0, length: attr.length))
        
        for result in results.reversed() {
            let chs = (emojiText as NSString).substring(with: result.range)
            if let pngPath = findChsPngPath(chs: chs) {
                let attach = NSTextAttachment()
                attach.image = UIImage(named: pngPath)
                attach.bounds =  CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
                attr.replaceCharacters(in: result.range, with: NSAttributedString(attachment: attach))
            }
        }
        return attr
    }
    
    
    private static func findChsPngPath(chs : String) -> String? {
        let manager = EmojiManager.shared
        
        for package in manager.emojiPackages {
            for emoji in package.emojis {                
                if chs == emoji.chs {
                    return emoji.png
                }
            }
        }
        return nil
    }
}
