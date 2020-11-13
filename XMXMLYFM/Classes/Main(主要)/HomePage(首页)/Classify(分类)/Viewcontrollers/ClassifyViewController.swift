//
//  ClassifyViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class ClassifyViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var tableView  : UITableView!
    var headerView : UIImageView!
    var collectionView : UICollectionView!
    
    
    var listArr: Array<CategoriesList?> = []
    
    var categories : Categories!
    
    let number : Int = 6
    
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView = UIImageView()
        self.headerView.frame = CGRect(x:0,y:0,width:XMScreenWidth,height:200)
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width:(XMScreenWidth - 1)/2, height:40)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 0

        self.collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout);
        self.collectionView.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(ClassifyItem.self, forCellWithReuseIdentifier: "ClassifyItem")
//        UICollectionElementKindSectionHeader
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "SectionHeader")

        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.refreshDataSource()

    }

    //请求数据
    func refreshDataSource(){
//        HomePageApi.requestCategories { (result, error) in
//            self.categories = JSONDeserializer<Categories>.deserializeFrom(json: JSON(result).description)
//            self.listArr = self.categories.list!
//
//            let firstItem = self.categories.list?.first
//            self.listArr .remove(at: 0)
////            self.headerView.xm_setImageWithUrl(url: (firstItem?.coverPath)! ,placeholder:"")
//
//            self.collectionView.reloadData()
//        }
    }

}



extension ClassifyViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let sec = self.listArr.count / 6
        let sub = self.listArr.count % 6
        return sub > 0 ? sec + 1 : sec
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sec: NSInteger = self.listArr.count / 6
        if section < sec {
            return 6
        } else {
            return (self.listArr.count % 6)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassifyItem", for: indexPath) as! ClassifyItem
        cell.categoriesList = self.listArr[indexPath.section * 6 + indexPath.row ];
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:XMScreenWidth/2, height:40)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{

        var footer = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionFooter {
            footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath as IndexPath)
        }
        return footer
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width:XMScreenWidth , height : 10)
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categories = self.listArr[indexPath.section * 6 + indexPath.row];
        let detailVC = ClassifyDetailViewController()
        detailVC.categoryId = (categories?.id)!
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }

    
    
    
}











