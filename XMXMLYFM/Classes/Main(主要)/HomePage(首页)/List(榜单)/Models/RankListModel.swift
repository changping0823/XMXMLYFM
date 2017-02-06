//
//  RankListModel.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/27.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class RankListModel: HandyJSON {
    var ret   : Int = 0
    var count : Int = 0
    var title : String?
    var list  :[ProgramList]?
//    var focusImages : [FocusImagesList]?
    
    required init() {}
}

class RankFocusImages : HandyJSON {
    var ret   : Int = 0
    var title : String?
    var list  :[RankFocusImageModel]?
//    "ret": 0,
//    "list"
//    "title": "焦点图"
    required init() {}
}
class RankFocusImageModel: HandyJSON {
    var activityId : Int = 0
    var focusCurrentId : Int = 0
    var id : Int = 0
    var isShare : Bool = false
    var is_External_url : Bool = false
    var longTitle : String?
    var pic : String?
    var shortTitle : String?
    var type : Int = 0
    var url : String?
    
    required init() {}
}


class ProgramList: HandyJSON {
    var ret : Int = 0
    var maxPageId : Int = 0
    var totalCount : Int = 0
    var pageId : Int = 0
    var pageSize : Int = 0
//    "list": [],
    var isAllPaid : Bool = false
    var rankingListId : Int = 0
    var coverPath : String?
    var title : String?
    var subtitle : String?
    var key : String?
    var orderNum : Int = 0
    var contentType : String?
    var rankingRule : String?
    var period : Int = 0
    var categoryId : Int = 0
    var firstId : Int = 0
    var firstTitle : String?
    var top : Int = 0
    var firstKResults : [KResults]?
    
    
    required init() {}
}



class KResults: HandyJSON {
    var id : Int = 0
    var title : String?
    var contentType : String?
    
    required init() {}
}







