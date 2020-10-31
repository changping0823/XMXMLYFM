//
//  XMCycleScrollView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class XMCycleScrollView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var collectionView : UICollectionView!
    var layout : UICollectionViewFlowLayout!
    var timer : Timer!
    
    let timeInterval : TimeInterval = 2
    
    
    let totalItemsCount : Int = 0
    var currentIndex : Int = 0
    
    
    var imageUrls = Array<String>() {
        didSet{
            self.collectionView.reloadData()
            self.beginTimer()
        }
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layout = UICollectionViewFlowLayout()
        self.layout.itemSize = CGSize(width: XMScreenWidth, height: self.height);
        self.layout.minimumInteritemSpacing = 0   //左右间距
        self.layout.minimumLineSpacing = 0         //上下间距
        self.layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let rect = CGRect.init(x: 0, y: 0, width: XMScreenWidth, height: self.height)
        
        self.collectionView = UICollectionView(frame: rect, collectionViewLayout: self.layout)
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.isPagingEnabled = true
        
        self.collectionView.register(XMCycleItem.self, forCellWithReuseIdentifier: "XMCycleItem")
        self.addSubview(self.collectionView)
        
        
    }
    
    
    @objc func timerSelector() {
        currentIndex += 1
        if currentIndex == self.imageUrls.count {
            currentIndex = 0
        }
        
        let index = IndexPath.init(row: currentIndex, section: 0)
        if currentIndex == 0 {
            self.collectionView.scrollToItem(at: index, at: .right, animated: false)
        }
        self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = CGRect.init(x: 0, y: 0, width: XMScreenWidth, height: self.height)

    }
    
    func beginTimer(){
        self.endTimer()
        
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                                target:self,
                                                selector:#selector(XMCycleScrollView.timerSelector),
                                              userInfo:nil,
                                               repeats:true)
        RunLoop.main.add(self.timer, forMode: RunLoop.Mode.common)
    }
    
    func endTimer(){
        if (self.timer == nil) {
            return
        }
        self.timer.invalidate()
        self.timer = nil;
    }

}




extension XMCycleScrollView{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.imageUrls.count > 0  {
            return self.imageUrls.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XMCycleItem", for: indexPath) as! XMCycleItem;
        cell.backgroundColor = UIColor.green
        if self.imageUrls.count > 0 {
            cell.imageUrl = self.imageUrls[indexPath.row]
        }
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.width ,height:self.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       self.currentIndex = Int((self.collectionView.contentOffset.x + self.layout.itemSize.width * 0.5) / self.layout.itemSize.width);
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.endTimer()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.beginTimer()
    }
    

    
}









