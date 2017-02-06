//
//  AnchorRecommend.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class AnchorRecommend: HandyJSON {
    var ret : Int = 0
    var famous : [Anchor]?
    var normal : [Anchor]?
    var msg : String?
    var relation : Relation?
    
    required init(){}
}



class Anchor: HandyJSON {
    var id : Int = 0
    var title : String?
    var displayStyle : Int = 0
    var list: [AnchorModel]?
    required init(){}
}
class AnchorModel: HandyJSON {
    var uid : Int = 0
    var nickname : String?
    var smallLogo : String?
    var middleLogo : String?
    var largeLogo : String?
    var isVerified : Bool = false
    var tracksCounts : Int = 0
    var followersCounts : Int = 0
    var personDescribe : String?
    var verifyTitle : String?
    required init(){}
}





class Relation: HandyJSON {
    var ret : Int = 0
    var msg : String?
    required init(){}
}




