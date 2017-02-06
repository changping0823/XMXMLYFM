//
//  FindModel.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class FindModel: HandyJSON {
    var ret : Int = 0
    var squareTabLastReadMillisecond : Int = 0
    var list : [FindList]?
    var msg : String?
    
    
    required init(){}

}
class FindList : HandyJSON {
    var id : Int = 0
    var list : [FindItem]?
    required init(){}
}


class FindItem: HandyJSON {
    var contentType : String?
    var contentUpdatedAt : Int = 0
    var coverPath : String?
    var enableShare : Bool = false
    var id : Int = 0
    var isExternalUrl : Bool = false
    var properties : [Category]?
    
    var sharePic : String?
    var subCoverPath : String?
    var subtitle : String?
    var title : String?
    var url : String?
    required init(){}
}


class Category: HandyJSON {
    var categoryId : Int = 0
    required init(){}
}










