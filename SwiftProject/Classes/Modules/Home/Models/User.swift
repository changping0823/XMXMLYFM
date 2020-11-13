//
//  User.swift
//  SwiftProject
//
//  Created by ren on 2020/11/12.
//

import UIKit
import KakaJSON

struct User: Convertible {
    let thumb: String = ""
    let medium: String = ""
    let age: Int = 0
    let id: String = ""
    let name: String = ""
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        if property.name == "name" { return "login" }
        return property.name
    }
}
