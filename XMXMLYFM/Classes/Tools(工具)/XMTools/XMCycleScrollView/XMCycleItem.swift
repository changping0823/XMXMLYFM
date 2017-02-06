//
//  XMCycleItem.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class XMCycleItem: UICollectionViewCell {
    
    var imageView : UIImageView!
    
    var imageUrl: String? {
        didSet{
            let resource   = ImageResource.init(downloadURL: URL.init(string: imageUrl!)!)
            let cache      = KingfisherManager.shared.cache
            let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                              KingfisherOptionsInfoItem.targetCache(cache)]
            
            self.imageView.kf.setImage(with: resource,
                                placeholder: UIImage(named:"find_usercover"),
                                    options: ptionsInfo,
                              progressBlock: nil,
                          completionHandler: nil)

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView()
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
