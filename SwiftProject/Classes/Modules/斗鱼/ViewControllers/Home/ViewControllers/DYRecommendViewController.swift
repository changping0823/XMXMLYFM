//
//  DYRecommendViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit
import Alamofire

private let kItemMargin : CGFloat = 10

let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4


class DYRecommendViewController: DYHomeBaseListViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let url = "http://www.douyutv.com/api/v1/slide/6"
        //  准备参数
        let params = ["version" : "2.300"]
        Network.GET(url: url, parameters: params).success { (response) in
            
            guard let dic = response as? [String: AnyObject] else {
                print("字典格式不正确")
                return
            }
            
            print(dic["data"])

            
        }.failed { (error) in
            print(error)
        }
 
    }
    
}
// MARK:- 遵守UICollectionView的代理协议
extension DYRecommendViewController : UICollectionViewDelegate {
    
}

extension DYRecommendViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: kNormalItemW, height: kNormalItemH)
    }
}

extension DYRecommendViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.取出Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        // 2.给cell设置数据
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        // 1.取出HeaderView
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
//
//        // 2.给HeaderView设置数据
//        headerView.group = baseVM.anchorGroups[indexPath.section]
//
//        return headerView
//    }
}
