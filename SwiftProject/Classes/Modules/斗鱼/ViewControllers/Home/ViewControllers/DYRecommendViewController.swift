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
        collectionView.register(DYHomeNormalCell.self, forCellWithReuseIdentifier: "DYHomeNormalCell")
        collectionView.register(DYHomeRecommentSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DYHomeRecommentSectionHeaderView")
        return collectionView
    }()
    
    lazy var recommendVM = DYRecommendViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        recommendVM.requestCycleData {
            self.collectionView.reloadData()
        }
 
        recommendVM.requestLiveData {
            self.collectionView.reloadData()
        }
    }
    
}
// MARK:- 遵守UICollectionView的代理协议
extension DYRecommendViewController : UICollectionViewDelegate {
    
}

extension DYRecommendViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.bounds.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: kNormalItemW, height: kNormalItemH)
    }
}

extension DYRecommendViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.liveArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 {
//            return recommendVM.cycleArray.count
//        }
        let group = recommendVM.liveArray[section]
        return group.room_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.取出Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DYHomeNormalCell", for: indexPath) as! DYHomeNormalCell
        // 2.给cell设置数据
        let group = recommendVM.liveArray[indexPath.section]

        cell.roomModel = group.room_list[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DYHomeRecommentSectionHeaderView", for: indexPath) as! DYHomeRecommentSectionHeaderView
        // 2.给HeaderView设置数据
        headerView.group = recommendVM.liveArray[indexPath.section]

        return headerView
    }
}
