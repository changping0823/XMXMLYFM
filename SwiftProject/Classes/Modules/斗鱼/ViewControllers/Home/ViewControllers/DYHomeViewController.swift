//
//  DYHomeViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit
import JXSegmentedView

class DYHomeViewController: DYBaseViewController {
    let titles = ["推荐", "游戏", "娱乐", "趣玩"]
    let segmentedDataSource = JXSegmentedTitleDataSource()
    var segmentedView = JXSegmentedView()
    lazy var listContainerView:JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
}

// MARK:- 设置UI界面
extension DYHomeViewController {
    func setupUI() {
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.设置导航栏
        setupNavigationBar()
        setupSegmentView()
    }
    
    func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageNamed: "logo",self,action: #selector(leftBarButtonItemClick))

        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageNamed: "image_my_history", highlightedImage: "Image_my_history_click", size: size,self,action: #selector(leftBarButtonItemClick))
        let searchItem = UIBarButtonItem(imageNamed: "btn_search", highlightedImage: "btn_search_clicked", size: size,self,action: #selector(leftBarButtonItemClick))
        let qrcodeItem = UIBarButtonItem(imageNamed: "Image_scan", highlightedImage: "Image_scan_click", size: size,self,action: #selector(leftBarButtonItemClick))
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
    }
    
    func setupSegmentView() {
        segmentedDataSource.titles = titles;
        segmentedDataSource.titleNormalFont    = UIFont.systemFont(ofSize: 16);
        segmentedDataSource.titleSelectedFont  = UIFont.boldSystemFont(ofSize: 18);
        segmentedDataSource.titleNormalColor   = UIColor.lightGray
        segmentedDataSource.titleSelectedColor = UIColor.black
        segmentedDataSource.itemWidth = 60

        segmentedView.delegate = self
        segmentedView.dataSource = segmentedDataSource
        view.addSubview(segmentedView)
        
        segmentedView.listContainer = listContainerView
        view.addSubview(listContainerView)
        
        segmentedView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(kNavigationBarH)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        listContainerView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(segmentedView.snp.bottom)
        }
    }
}


// MARK:- 点击事件
extension DYHomeViewController {
    @objc func leftBarButtonItemClick() {
        let tabbar = tabBarController
        tabbar?.navigationController?.navigationBar.isHidden = false
        tabbar?.navigationController?.popToRootViewController(animated: true)
    }
}

extension DYHomeViewController : JXSegmentedViewDelegate{
    
}

extension DYHomeViewController : JXSegmentedListContainerViewDataSource{
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        if let titleDataSource = segmentedView.dataSource as? JXSegmentedBaseDataSource {
            return titleDataSource.dataSource.count
        }
        return 0
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        if index == 0 {
            return DYRecommendViewController()
        }else if index == 1{
            return DYGameViewController()
        }else if index == 2{
            return DYAmuseViewControllerViewController()
        }else if index == 3{
            return DYFunnyViewController()
        }
        return DYHomeBaseListViewController()
    }
}
