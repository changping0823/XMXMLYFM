//
//  WBHomeViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/6.
//

import UIKit

import JXSegmentedView

class WBHomeViewController: WBBaseViewController {

    
    let segmentedDataSource = JXSegmentedTitleDataSource()
    var tableView = UITableView()
    var segmentedView = JXSegmentedView()
    
    lazy var listContainerView:JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titles = ["关注", "推荐"]
        segmentedDataSource.titles = titles
        segmentedDataSource.titleNormalFont    = UIFont.systemFont(ofSize: 16);
        segmentedDataSource.titleSelectedFont  = UIFont.boldSystemFont(ofSize: 18);
        segmentedDataSource.titleNormalColor   = UIColor.lightGray
        segmentedDataSource.titleSelectedColor = UIColor.black
        segmentedDataSource.itemWidth = 60
        
        
        segmentedView.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        segmentedView.delegate = self
        segmentedView.dataSource = segmentedDataSource
        self.parent?.navigationItem.titleView = segmentedView
        
        segmentedView.listContainer = listContainerView
        self.view.addSubview(listContainerView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listContainerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }
}


extension WBHomeViewController: JXSegmentedViewDelegate{
    
}

extension WBHomeViewController : JXSegmentedListContainerViewDataSource{
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource{
            return titleDataSource.dataSource.count
        }
        return 0
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0 {
            return WBFocusViewController()
        }
        return WBRecommendViewController()
    }
}
