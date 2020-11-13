//
//  HomePageViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
import KakaJSON
import JXSegmentedView

let ToolBarHeight : CGFloat = 44

class HomePageViewController: XMBaseViewController{
    
    var titles: [String] = []
    
    var segmentedDataSource = JXSegmentedTitleDataSource()

    let segmentedView = JXSegmentedView()
    
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showBackButton(show: false)
        
        segmentedDataSource = JXSegmentedTitleDataSource()

        segmentedDataSource.titles = titles
//        segmentedDataSource.isTitleMaskEnabled = true
        segmentedDataSource.titleNormalColor = UIColor.black
        segmentedDataSource.titleSelectedColor = UIColor.black
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.isTitleZoomEnabled = true
        segmentedDataSource.titleSelectedZoomScale = 1.3
        segmentedDataSource.isTitleStrokeWidthEnabled = true
        segmentedDataSource.isSelectedAnimable = true
        segmentedDataSource.itemSpacing = 10
        
        segmentedView.dataSource = segmentedDataSource
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.width, height: 44)
        segmentedView.delegate = self
        navigationItem.titleView = segmentedView
        
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        segmentedView.indicators = [indicator]
        
        segmentedView.listContainer = listContainerView
        listContainerView.frame = view.bounds
        view.addSubview(listContainerView)
        
        
        networkRequest()
    }
    

}


extension HomePageViewController{
    func networkRequest() {
        
        let url = "http://mobile.ximalaya.com/mobile/discovery/v2/tabs?device=iPhone&version=5.4.57"
        HN.POST(url: url, parameters: nil).success { (response) in

            let jsonResult = response as! Dictionary<String,AnyObject>
            let list: [String: Any] = jsonResult["tabs"] as! [String : Any]
            let dataArray = list.kj.model(HomePageTabList.self)

            print(dataArray);
            let tabList:[HomePageTab] = dataArray.list!
            
        
            for tab in tabList {
                self.titles.append(tab.title!)
            }
            
            self.segmentedDataSource.titles = self.titles
            self.segmentedView.reloadData()
            
        }.failed { (error) in
            // TODO...
        }

    }
}

extension HomePageViewController: JXSegmentedViewDelegate{
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        
    }
}

extension HomePageViewController: JXSegmentedListContainerViewDataSource{
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if (index % 2 == 0) {
            return BroadcastViewController()
        }
        return AnchorViewController()
    }
}




