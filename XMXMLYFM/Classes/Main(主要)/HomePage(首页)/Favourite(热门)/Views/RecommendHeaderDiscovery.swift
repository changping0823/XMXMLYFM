//
//  RecommendHeaderDiscovery.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class RecommendHeaderDiscovery: UIView {

    var scrollView : UIScrollView!
    
    
    var columnsList = Array<DiscoveryColumnsList>() {
        didSet{
            self.discoveryColumns()
        }
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.scrollView = UIScrollView()
        self.scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    func discoveryColumns(){
        let itemW      : Int = 45
        let titleW     : Int = 60
        let space      : Int = 30
        self.scrollView.contentSize = CGSize(width:self.columnsList.count * (itemW + space) + 10 , height:0)
        

        for index in 0..<self.columnsList.count {
            let item = self.columnsList[index]
            
            
            let imageView = UIImageView()
            self.scrollView.addSubview(imageView)
            
            
            
            let resource   = ImageResource.init(downloadURL: URL.init(string: item.coverPath!)!)
            let cache      = KingfisherManager.shared.cache
            let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                              KingfisherOptionsInfoItem.targetCache(cache)]
            
//            imageView.kf.setImage(with: resource,
//                           placeholder: UIImage(named:"find_usercover"),
//                               options: ptionsInfo,
//                         progressBlock: nil,
//                     completionHandler: nil)
            imageView.xm_setImageWithUrl(url: item.coverPath!, placeholder: "find_usercover")
            
            let titleLabel = UILabel()
            titleLabel.text = item.title
            titleLabel.font = UIFont.systemFont(ofSize: 12)
            titleLabel.textAlignment = NSTextAlignment.center
            self.scrollView.addSubview(titleLabel)
            
            
            
            imageView.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(self.snp.top).offset(10)
                make.width.height.equalTo(itemW)
                make.left.equalTo( 10 + (itemW + space) * index)
            })
            
            titleLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(imageView.snp.bottom).offset(5)
                make.width.equalTo(titleW)
                make.height.equalTo(20)
                make.centerX.equalTo(imageView)
            })
            
            
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
