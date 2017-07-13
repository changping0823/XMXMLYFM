//
//  AnchorViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class AnchorViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var recommends : AnchorRecommend!
    var anchors: NSMutableArray = []
    
    
    var space : CGFloat = 15
    
    var collectionView : UICollectionView!
    var layout : UICollectionViewFlowLayout!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout = UICollectionViewFlowLayout()
        self.layout.minimumLineSpacing = self.space       //上下间距
        self.layout.minimumInteritemSpacing = self.space   //左右间距
        self.layout.scrollDirection = UICollectionViewScrollDirection.vertical
        self.layout.headerReferenceSize = CGSize(width:XMScreenWidth,height:40);
        
        self.collectionView = UICollectionView(frame:CGRect.init(x:0,y:0,width:0,height:0), collectionViewLayout:self.layout);
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.register(AnchorItem.self, forCellWithReuseIdentifier:"AnchorItem")
        self.collectionView.register(AnchorHeaderView.self,forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier:"headView")
        self.collectionView.register(UICollectionReusableView.self,forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier:"footView")

        self.view.addSubview(self.collectionView)
        
        
        
        
        self.collectionView?.snp.makeConstraints({ (make) -> Void in
            make.edges.equalToSuperview()
        })
        
        self.refreshDataSource()
    }
    
    
    
    
    
    
    func refreshDataSource(){
        HomePageApi.requestAnchorRecommend { (result, error) in
            self.recommends = JSONDeserializer<AnchorRecommend>.deserializeFrom(json: JSON(result).description)
            self.anchors.addObjects(from: self.recommends.famous!)
            self.anchors.addObjects(from: self.recommends.normal!)
            self.collectionView.reloadData()
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension AnchorViewController {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.anchors.count
    }

 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: XMScreenWidth, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: XMScreenWidth, height: 10)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let anchor = self.anchors[section] as! Anchor
        
        return (anchor.list!.count / 3)==0 ? (anchor.list!.count):(anchor.list!.count / 3) * 3
    }
    
    //返回自定义HeadView或者FootView，我这里以headview为例
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header = AnchorHeaderView()
        var footer = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headView", for: indexPath as IndexPath) as! AnchorHeaderView
        }else if kind == UICollectionElementKindSectionFooter{
            footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footView", for: indexPath)
            footer.backgroundColor = RGBA(r: 235, g: 235, b: 235, a: 1)
        }
        
        
        if kind == UICollectionElementKindSectionHeader{
            header.anchor = self.anchors[indexPath.section] as? Anchor
            return header
        }else{
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnchorItem", for: indexPath) as! AnchorItem;
        let anchor = self.anchors[indexPath.section] as? Anchor
        cell.anchor = anchor?.list?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wid = XMScreenWidth == 320 ? (XMScreenWidth - self.space * 4):(XMScreenWidth - self.space * 3 * 2)
        return CGSize(width: wid / 3, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, self.space, 0, self.space)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
    
}







