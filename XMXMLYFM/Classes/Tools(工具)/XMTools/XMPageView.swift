//
//  XMPageView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2017/7/14.
//  Copyright © 2017年 任长平. All rights reserved.
//

import UIKit

class XMPageView: UIView {
    
    var collectionView :UICollectionView!
    
    var titles : Array<String>? {
        didSet{
           
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let rect =  CGRect(x:0,y:0,width:XMScreenWidth,height:XMScreenHeight)
        self.collectionView = UICollectionView.init(frame: rect, collectionViewLayout: flowLayout);
        self.collectionView.backgroundColor = UIColor.white;
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView?.register(XMFindToolBarCell.self, forCellWithReuseIdentifier: "XMFindToolBarCell")

        self.addSubview(self.collectionView)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = CGRect(x:0,y:0,width:XMScreenWidth,height:self.height)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

}

extension XMPageView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.titles != nil) {
            return (self.titles!.count)
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XMFindToolBarCell", for: indexPath) as! XMFindToolBarCell;
        cell.backgroundColor = RandomColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:60,height:40)
    }
    
}


