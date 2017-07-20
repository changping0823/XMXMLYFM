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

let ToolBarHeight : CGFloat = 44

class HomePageViewController: XMBaseViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,XMFindToolBarDelegate {
    var tabs : HomePageTabList!
    
    var collectionView :UICollectionView!
    
    
    lazy var viewControllers: [UIViewController] = {
        return [RecommendViewController(),
                FavouriteViewController(),
                ClassifyViewController(),
                ListViewController(),
                AnchorViewController()]
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //这句不知道干什么的，会影响scrollerView
        automaticallyAdjustsScrollViewInsets = false
        self.showBackButton(show: false)
        self.view.addSubview(findToolBar)
        
        HomePageApi.requestHomePageTabs { (result, error) in
            let dict = result?["tabs"] as! NSDictionary?
            self.tabs = JSONDeserializer<HomePageTabList>.deserializeFrom(dict: dict)
            self.findToolBar.tabs = self.tabs
            self.xm_findToolBarSelectedItem(index: 1)
            self.collectionView.reloadData()
        }
        
        
        
        let layout = UICollectionViewFlowLayout();
        
        self.collectionView = UICollectionView(frame: CGRect.init(x: 0, y:XMNavHeight + XMToolBarH, width: XMScreenWidth, height: self.view.height - XMToolBarH), collectionViewLayout: layout);
        
        self.collectionView?.register(XMFindItemCell.self, forCellWithReuseIdentifier: "XMFindItemCell")
        
        self.collectionView.delegate   = self;
        self.collectionView.dataSource = self;
        self.collectionView.isPagingEnabled = true
        self.collectionView.backgroundColor = UIColor.white
        
        layout.itemSize = CGSize(width: XMScreenWidth, height: self.view.height - XMToolBarH);
        layout.minimumLineSpacing = 0        //上下间距
        layout.minimumInteritemSpacing = 0   //左右间距
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        self.view.addSubview(self.collectionView!);

        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.tabs != nil) {
            return self.tabs.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XMFindItemCell", for: indexPath) as! XMFindItemCell;
        let vc = viewControllers[indexPath.row]
        self.addChildViewController(vc);
        vc.view.frame = CGRect(x:0,y:0,width:XMScreenWidth,height:XMScreenHeight - XMToolBarH - XMTabBarH - XMNavHeight)
        cell.content = vc.view
        return cell;
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX : CGFloat = scrollView.contentOffset.x
        let number : Int = Int(offsetX / XMScreenWidth)
        self.findToolBar.selectedItem = number
        
    }
    
    
    func xm_findToolBarSelectedItem(index: Int) {
        UIView.animate(withDuration: 0.24, animations: {
            self.collectionView!.contentOffset = CGPoint(x: CGFloat(index) * XMScreenWidth,y: 0)
        }, completion: nil)
    }
    
    
    
    
    lazy var findToolBar: XMFindToolBar = { [unowned self] in
        var toolBar = XMFindToolBar()
        toolBar.frame = CGRect(x:0,y:XMNavHeight,width:XMScreenWidth,height:XMToolBarH)
        toolBar.selectedItem = 1
        toolBar.delegate = self
        return toolBar
        }()
}







