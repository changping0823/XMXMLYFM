//
//  Comment.swift
//  SwiftProject
//
//  Created by ren on 2020/11/12.
//

import KakaJSON

struct Comment: Convertible {
    let floor: Int = 0
    let created_at: Int = 0
    let content:String = ""
    let parentId: Int = 0
    let likeCount: Int = 0
    let user: User! = nil
}
