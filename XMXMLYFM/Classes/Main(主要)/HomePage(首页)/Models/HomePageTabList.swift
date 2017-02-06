//
//  HomePageTabList.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/27.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

import HandyJSON

class HomePageTabList: HandyJSON {
    var count : Int = 0
    var first : Int = 0
    var list : [HomePageTab]?
    required init() {}
    
}

class HomePageTab: HandyJSON {
    var title : String?
    var contentType : String?
    
    required init() {}
}






