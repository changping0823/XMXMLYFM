//
//  HotAndGuess.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/15.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class HotAndGuess: HandyJSON {

    var ret: Int = 0
    var discoveryColumns :DiscoveryColumns?
    var guess : Guess?
    var hotRecommends : HotRecommends?
    
    
    required init() {}

}


/////////////////////  *****    DiscoveryColumns    ***** //////////////////////
class DiscoveryColumns: HandyJSON {
    var ret : Int = 0
    var title : String?
    var list : [DiscoveryColumnsList]?
    required init() {}
}

class DiscoveryColumnsList: HandyJSON {
    //    "id": 84,
    var ret : Int = 0
    //    "title": "经典必听",
    var title : String?
    //    "subtitle": "",
    var subtitle : String?
    //    "coverPath": "http://fdfs.xmc.jpg",
    var coverPath : String?
    //    "contentType": "ranking_list",
    var contentType : String?
    //    "url": "",
    var url : String?
    //    "sharePic": "",
    var sharePic : String?
    //    "enableShare": false,
    var enableShare : Bool = false
    //    "isExternalUrl": false,
    var isExternalUrl : Bool = false
    //    "contentUpdatedAt": 0,
    var contentUpdatedAt : Int = 0
    var properties : Properties?
    
    required init() {}
}

class Properties: HandyJSON {
    var categoryId : Int = 0
    //    "contentType": "album",
    var contentType : String?
    //    "rankingListId": 21,
    var rankingListId : Int = 0
    //    "isPaid": false,
    var isPaid : Bool = false
    //    "key": "ranking:album:subscribed:30:0"
    var key : String?
    
    required init() {}
}




/////////////////////  *****    Guess    ***** //////////////////////

class Guess: HandyJSON {
    var hasMore : Bool = false
    var loopCount : Int = 0
    var title : String?
    
    var list : [GuessList]?
    
    required init() {}
}

class GuessList: HandyJSON {
    //    "id": 233180,
    var id : Int = 0
    //    "albumId": 233180,
    var albumId : Int = 0
    //    "uid": 4175683,
    var uid : Int = 0
    //    "intro": "《这也是一切》-舒婷",
    var intro : String?
    //    "nickname": "寒白声惑",
    var nickname : String?
    //    "albumCoverUrl290": "http:_mobile_meduim.jpg",
    var albumCoverUrl290 : String?
    //    "coverSmall": "http://fdfs.xmcdn.c_mobile_small.jpg",
    var coverSmall : String?
    //    "coverMiddle": "http://fdfs.xmcdn.mobile_meduim.jpg",
    var coverMiddle : String?
    //    "coverLarge": "http://fdfs.xmcdn.mobile_large.jpg",
    var coverLarge : String?
    //    "title": "阅读经典",
    var title : String?
    //    "tags": "诗歌,散文,文化",
    var tags : String?
    //    "tracks": 111,
    var tracks : Int = 0
    //    "playsCounts": 38815791,
    var playsCounts : Int = 0
    //    "isFinished": 0,
    var isFinished : Bool = false
    //    "serialState": 0,
    var serialState : Int = 0
    //    "trackId": 26701656,
    var trackId : Int = 0
    //    "trackTitle": "《这也是一切》-舒婷",
    var trackTitle : String?
    //    "recSrc": "HotRec:cth",
    var recSrc : String?
    //    "recTrack": "mr.discover:2",
    var recTrack : String?
    //    "provider": "recsys",
    var provider : String?
    //    "isPaid": false,
    var isPaid : Bool = false
    //    "commentsCount": 0,
    var commentsCount : Int = 0
    //    "priceTypeId": 0
    var priceTypeId : Int = 0
    
    
    
    //    "price": 0.20,
    var price : Float = 0
    //    "discountedPrice": 0.20,
    var discountedPrice : Float = 0
    //    "score": 0.0,
    var score : Float = 0
    //    "displayPrice": "0.20喜点/集",
    var displayPrice : String?
    //    "displayDiscountedPrice": "0.20喜点/集",
    var displayDiscountedPrice : String?
    //    "priceTypeEnum": 1
    var priceTypeEnum : Int = 0
    required init() {}
}





/////////////////////  *****    Guess    ***** //////////////////////

class CityColumn: HandyJSON {
    var hasMore : Bool = false
    var title : String?
    var count : Int = 0
    
    var list : [CityColumnList]?
    
    var contentType : String?
    var code : String?
    required init() {}
}

class CityColumnList: HandyJSON {
    var id : Int = 0
    var albumId : Int = 0
    //    "uid": 1084167,
    var uid : Int = 0
    //    "intro": "正直的掉掉为你带来一档非常正直的节目",
    var intro : String?
    //    "nickname": "掉掉",
    var nickname : String?
    //    "albumCoverUrl290": "http://fdfs.xmcdn.com/mobile_meduim.jpg",
    var albumCoverUrl290 : String?
    //    "coverSmall": "http://fdfs.xmcdn.com/_mobile_small.jpg",
    var coverSmall : String?
    //    "coverMiddle": "http://fdfs.xmcdn.com/mobile_meduim.jpg",
    var coverMiddle : String?
    //    "coverLarge": "http://fdfs.xmcdn.com/mobile_large.jpg",
    var coverLarge : String?
    //    "title": "非常不着调",
    var title : String?
    //    "tags": "笑话,脱口秀,流行",
    var tags : String?
    //    "tracks": 319,
    var tracks : Int = 0
    //    "playsCounts": 56351185,
    var playsCounts : Int = 0
    //    "isFinished": 0,
    var isFinished : Bool = false
    //    "serialState": 0,
    var serialState : Int = 0
    //    "trackId": 26891848,
    var trackId : Int = 0
    //    "trackTitle": "【非常不着调】317-二胎也挺麻烦的【汉兰达赞助播出】",
    var trackTitle : String?
    //    "provider": "man",
    var provider : String?
    //    "isPaid": false,
    var isPaid : Bool = false
    //    "commentsCount": 0,
    var commentsCount : Int = 0
    //    "priceTypeId": 0
    var priceTypeId : Int = 0
    
     required init() {}
}

/////////////////////  *****    HotRecommends    ***** //////////////////////

class HotRecommends: HandyJSON {
    var hasMore : Bool = false
    var loopCount : Int = 0
    var list : [HotRecommendsList]?
    required init() {}
}

class HotRecommendsList: HandyJSON {
     //    "title": "精品",
     var title : String?
    //    "contentType": "album",
    var contentType : String?
    //    "isFinished": false,
    var isFinished : Bool = false
    //    "categoryId": 33,
    var categoryId : Int = 0
    //    "categoryType": 1,
    var categoryType : Int = 0
    //    "count": 1000,
    var count : Int = 0
    //    "hasMore": true,
    var hasMore : Bool = false
    
    var list : [GuessList]?
    
    var filterSupported : Bool = false
    var isPaid : Bool = false
    
    required init() {}
}








