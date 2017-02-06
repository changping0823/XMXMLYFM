//
//  Categories.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class Categories: HandyJSON {
    var ret: Int = 0
    var discoveryColumns :DiscoveryColumns?
    var list :[CategoriesList]?
    
    required init() {}
}



class CategoriesList: HandyJSON {
    
    var id          : Int = 0
    var orderNum    : Int = 0
    var categoryType: Int = 0
    
    var name        : String?
    var title       : String?
    var coverPath   : String?
    var contentType : String?
    
    var isPaid          : Bool = false
    var isChecked       : Bool = false
    var isFinished      : Bool = false
    var selectedSwitch  : Bool = false
    var filterSupported : Bool = false
    
    required init() {}
}





