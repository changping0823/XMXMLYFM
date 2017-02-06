//
//  HomePageApi.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
/// 首页标题
fileprivate let kHomePageTabs = "http://mobile.ximalaya.com/mobile/discovery/v2/tabs?device=iPhone&version=5.4.57"

/// 推荐
fileprivate let kTuiJianAPI = "http://ifm.ximalaya.com/recsys-stream-query/recsys/stream/feed?device=iPhone"

/// 小编推荐 - 轮播图 - 精品听单
fileprivate let kRecommendAPI = "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"
/// 猜你喜欢 - 听北京 - 热门推荐
fileprivate let kHotAndGuessAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21"
/// 现场直播
fileprivate let kLiveRecommendAPI = "http://live.ximalaya.com/live-activity-web/v3/activity/recommend"
/// FooterAd
fileprivate let kRecomBannerAPI = "http://adse.ximalaya.com/ting?appid=0&device=iPhone&name=find_banner&network=WIFI&operator=3&scale=2&version=5.4.21"

/// 分类
fileprivate let kCategoriesAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&code=43_310000_3100&device=iPhone&picVersion=13&scale=3&version=5.4.57"

/// 榜单
fileprivate let kRankingListAPI = "http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=3&version=5.4.57"

/// 主播
fileprivate let kAnchorRecommendAPI = "http://mobile.ximalaya.com/mobile/discovery/v1/anchor/recommend?device=iPhone&version=5.4.57"

class HomePageApi: NSObject {
    
    
    /// 获取首页标题
    class func requestHomePageTabs(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .POST, urlString: kHomePageTabs, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    /// 推荐
    class func requestTuiJian(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .POST, urlString: kTuiJianAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    /// 小编推荐 - 轮播图 - 精品听单
    class func requestRecommends(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .POST, urlString: kRecommendAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    /// 猜你喜欢 - 听北京 - 热门推荐
    class func requestHotAndGuess(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kHotAndGuessAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    /// 现场直播
    class func requestLiveRecommend(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kLiveRecommendAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    /// FooterAd
    class func requestFooterAd(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kRecomBannerAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    class func requestCategories(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kCategoriesAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    /// 榜单
    class func requestRankingList(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kRankingListAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }
    
    /// 主播
    class func requestAnchorRecommend(_ finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ()) {
        XMNetwrorkTool.shareInstance.xm_requestData(methodType: .GET, urlString: kAnchorRecommendAPI, parameters: nil) { (result, error) in
            finished(result, error)
        }
    }


}
