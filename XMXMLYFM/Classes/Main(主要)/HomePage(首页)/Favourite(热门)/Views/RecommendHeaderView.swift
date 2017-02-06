//
//  RecommendHeaderView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class RecommendHeaderView: UIView {
    var imageArray: [String] = [String]()
    
    lazy var cycleScrollView: XMCycleScrollView = {
        let view = XMCycleScrollView()
        return view
    }()
    
    lazy var discovery: RecommendHeaderDiscovery = {
        let view = RecommendHeaderDiscovery()
        return view
    }()
    
    var splitLine : UIView!
    
    
    var focusImages : NSArray? {
        didSet{
            guard let specialList = focusImages else { return }

            for index in 0..<specialList.count {
                let image:FocusImagesList = specialList[index] as! FocusImagesList
                imageArray.append(image.pic!)
            }
            self.cycleScrollView.imageUrls = self.imageArray
        }
    }
    
    
    var discoveryColumns : DiscoveryColumns! {
        didSet{
            self.discovery.columnsList = discoveryColumns.list!
            //更新约束
            self.discovery.snp.updateConstraints { (make) -> Void in
                make.left.right.equalToSuperview()
                make.top.equalTo(self.cycleScrollView.snp.bottom)
                make.height.equalTo(self.discovery.columnsList.count == 0 ? 0:120)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.cycleScrollView)
        self.addSubview(self.discovery)
        
        self.splitLine = UIView()
        self.splitLine.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)
        self.addSubview(self.splitLine)
        
        self.cycleScrollView.snp.makeConstraints { (make) -> Void in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        self.discovery.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.cycleScrollView.snp.bottom)
            make.height.equalTo(120)
        }
        
        self.splitLine.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
