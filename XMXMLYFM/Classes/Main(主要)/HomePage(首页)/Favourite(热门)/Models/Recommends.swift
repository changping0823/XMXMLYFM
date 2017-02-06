//
//  Recommends.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import HandyJSON

class Recommends: HandyJSON {
    //"ret": 0,
    var ret: Int = 0
    var editorRecommendAlbums :EditorRecommendAlbums?
    var focusImages : FocusImages?
    
    required init() {}
}







class EditorRecommendAlbums : HandyJSON{
//    "ret": 0,
    var ret: Int = 0
//    "title": "小编推荐",
    var title : String?
//    "hasMore": true,
    var hasMore: Bool = false
    var list: [EditorRecommendAlbumsList]?
   required init() {}
}


class FocusImages: HandyJSON {
    //    "title": "焦点图"
    var title : String?
    //    "ret": 0,
    var ret: Int = 0
    var list: [FocusImagesList]?
    required init() {}

}


class EditorRecommendAlbumsList: HandyJSON {
    //    "id": 236268,
    var id: Int = 0
    //    "albumId": 236268,
    var albumId: Int = 0
    //    "uid": 1716986,
    var uid: Int = 0
    //    "intro": "除了老歌，还有很多",
    var intro : String?
    //    "nickname": "李峙",
    var nickname : String?
    //    "albumCoverUrl290": "http://fdfs.xmcdn.com/gr",
    var albumCoverUrl290 : String?
    //    "coverSmall": "http://fdfs.xmcdn.ll.jpg",
    var coverSmall : String?
    //    "coverMiddle": "http://fdfs.xmcdn.com/_meduim.jpg",
    var coverMiddle : String?
    //    "coverLarge": "http://fdfs.xmcdn.co_mobile_large.jpg",
    var coverLarge : String?
    //    "title": "李峙电台",
    var title : String?
    //    "tags": "电台,广播,音乐",
    var tags : String?
    //    "tracks": 351,
    var tracks: Int = 0
    //    "playsCounts": 31673595,
    var playsCounts: Int = 0
    //    "isFinished": 0,
    var isFinished: Bool = false
//    "serialState": 0,
    //    "trackId": 26845989,
    var trackId: Int = 0
    //    "trackTitle": "诗谱曲成歌,唱的是岁月和山河",
    var trackTitle : String?
    //    "provider": "man",
    var provider : String?
    //    "isPaid": false,
    var isPaid: Bool = false
    //    "commentsCount": 0,
    var commentsCount: Int = 0
    //    "priceTypeId": 0
    var priceTypeId: Int = 0
    
    required init() {}

}

class FocusImagesList: HandyJSON {
    //    "id": 13055,
    var id: Int = 0
    //    "shortTitle": "【首页】别说了，羞死啦！10大有毒的话题精",
    var shortTitle : String?
    //    "longTitle": "【首页】别说了，羞死啦！10大有毒的话题精",
    var longTitle : String?
    //    "pic": "http://fdfs.xmcdn.com/_large.jpg",
    var pic : String?
    //    "type": 9,
    var type: Int = 0
    //    "specialId": 841,
    var specialId: Int = 0
    //    "subType": 2,
    var subType: Int = 0
    //    "isShare": true,
    var isShare: Bool = false
    //    "is_External_url": false,
    var is_External_url: Bool = false
    //    "focusCurrentId": 0
    var focusCurrentId: Int = 0
    
    required init() {}

}





