//
//  XMFindToolBar.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit


let identify:String = "XMFindToolBarCell"
let XMToolBarH: CGFloat = 44


protocol XMFindToolBarDelegate : NSObjectProtocol {
    func xm_findToolBarSelectedItem(index:Int)
}

class XMFindToolBar: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{


    
    weak var delegate: XMFindToolBarDelegate?
    
    var collectionView :UICollectionView?
    var lineView : UIView?
    var underline : UIView?   //下划线
    var titleCount : Int = 3
    
    
    
    
    var selectedItem : Int = 0 {
        didSet {
            if (self.tabs != nil) {
                let defaultSelectCell = IndexPath(row: selectedItem, section: 0)
                self.collectionView?.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionViewScrollPosition.left)
                self.collectionView?.reloadData()
            }
        }
    }
    

    var tabs : HomePageTabList? {

        didSet{
            self.titleCount = (tabs?.list?.count)!
            setTitlesArray()
        }
    }
    
    
    var cellArray:NSMutableArray = NSMutableArray()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout();
        
        self.collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: XMScreenWidth, height: XMToolBarH), collectionViewLayout: layout)
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(XMFindToolBarCell.self, forCellWithReuseIdentifier: "XMFindToolBarCell")
        
        self.collectionView?.delegate = self;
        self.collectionView?.dataSource = self;
        
        layout.minimumInteritemSpacing = 0   //左右间距
        layout.minimumLineSpacing = 0         //上下间距
        self.addSubview(self.collectionView!);
        
        self.lineView = UIView(frame:CGRect.init())
        self.lineView?.backgroundColor = UIColor.lightGray
        self.addSubview(self.lineView!)
        
        self.underline = UIView(frame:CGRect.init())
        self.underline?.backgroundColor = UIColor.red
        self.addSubview(self.underline!)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setTitlesArray() {
        self.underline?.width = XMScreenWidth / CGFloat(self.titleCount)
        self.collectionView?.reloadData()
    }
    
    override func layoutSubviews() {
        
        let lineH: CGFloat = 0.5
        self.collectionView?.frame = CGRect(x:0,y:0,width:self.width,height:self.height - lineH)
        self.lineView?.frame = CGRect(x:0,y:self.height - lineH,width:self.width,height:lineH)
        
        self.underline?.frame = CGRect(x:0,y:self.height - 2,width:self.width / CGFloat(titleCount),height:1.5)

    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.tabs != nil) {
            return (self.tabs!.list?.count)!
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XMFindToolBarCell", for: indexPath) as! XMFindToolBarCell;
        if (self.tabs != nil) {
            
            if indexPath.row == self.selectedItem {
            cell.titleButton?.setTitleColor(UIColor.red, for: .normal)
            UIView.animate(withDuration: 0.24, animations: {
                self.underline?.x = CGFloat(indexPath.row) * (self.width / CGFloat(self.titleCount))
            }, completion: nil)
        }else{
            cell.titleButton?.setTitleColor(UIColor.black, for: .normal)
            }
            let tab = self.tabs?.list?[indexPath.row];
            cell.titleButton?.setTitle(tab?.title, for:.normal)
            
            self.cellArray.add(cell)
        }
        
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: XMScreenWidth/CGFloat(titleCount) - 2, height: XMToolBarH)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.xm_findToolBarSelectedItem(index: indexPath.row)
        self.selectedItem = indexPath.row
        collectionView.reloadData()
    }
    
    
}









