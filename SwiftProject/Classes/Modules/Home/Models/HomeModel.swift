//
//  HomeModel.swift
//  SwiftProject
//
//  Created by ren on 2020/11/12.
//

import UIKit
import KakaJSON

struct HomeModel: Convertible {
    let content: String = ""
    let commentsCount: Int = 0
    let lowUrl: String = ""
    let highUrl: String = ""
    let originUrl: String = ""
    let publishedAt: Int = 0
    let user: User! = nil
    let hotComment: Comment? = nil
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }


}
