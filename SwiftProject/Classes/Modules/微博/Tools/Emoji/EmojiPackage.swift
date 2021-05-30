//
//  EmojiPackage.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/30.
//

import UIKit

class EmojiPackage: NSObject {
    @objc var id: String?
    @objc var name: String?
    var emojis = [EmojiModel]()
    
    init(dict : [String : String]) {
        super.init()
        
        setValuesForKeys(dict)
        
        
        guard let path = Bundle.main.path(forResource: "\(id!)/info.plist", ofType: nil, inDirectory: "Emoji.bundle")else {
            return
        }
        
        
        guard let dt = NSDictionary(contentsOfFile: path) as? [String:Any] else {
            return
        }
        guard let array = dt["emojis"] as? [[String:String]] else {
            return
        }
        for var (i,dx) in array.enumerated() {
//            if let png = dx["png"] {
//                dx["png"] = id! + "/" + png
//            }
//            if i%31 == 0 && i != 0{
//                emojis.append(EmojiModel(isDelete: true))
//            }
            emojis.append(EmojiModel(dict: dx))
        }
//        let r = emojis.count%32
//        //填充空格  8*4
//        if  r != 0{
//            for _ in r..<31{
//                emojis.append(EmojiModel(isSpace: true))
//            }
//            emojis.append(EmojiModel(isDelete: true))
//        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
