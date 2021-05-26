//
//  NSDate+Extension.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/26.
//

import UIKit

extension Date {
    static func currentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
