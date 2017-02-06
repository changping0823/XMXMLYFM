//
//  UIImageView+Extension.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/19.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func xm_setImageWithUrl(url: String , placeholder:String) {
        let resource = ImageResource.init(downloadURL: URL.init(string: url)!)
        let cache      = KingfisherManager.shared.cache
        let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                          KingfisherOptionsInfoItem.targetCache(cache)]
        
        
        let image = UIImage(named:placeholder)
        
        self.kf.setImage(with: resource,
                  placeholder: image,
                      options: ptionsInfo,
                progressBlock: nil,
            completionHandler: nil)
    }
}



