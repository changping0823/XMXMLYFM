//
//  RecommentItem.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/15.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class RecommentItem: UIView {
    
    
    var coverImage : UIImageView!
    var titleLabel : UILabel!
    var introLabel : UILabel!
    
    
    var albumsList: EditorRecommendAlbumsList? {
        didSet{
            
            
            let cache      = KingfisherManager.shared.cache
            let resource   = ImageResource.init(downloadURL: URL.init(string: (albumsList?.coverLarge)!)!)
            let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                              KingfisherOptionsInfoItem.targetCache(cache)]
            
//            self.coverImage.kf.setImage(with: resource,
//                                 placeholder:UIImage(named:"find_usercover"),
//                                     options: ptionsInfo,
//                               progressBlock: nil,
//                           completionHandler: nil)
            self.coverImage.xm_setImageWithUrl(url: (albumsList?.coverLarge)!, placeholder: "find_usercover")
            
            self.introLabel.text = albumsList?.trackTitle
            self.titleLabel.text = albumsList?.title
        }
    }
    
    var guessList: GuessList? {
        didSet{
            
            let resource   = ImageResource.init(downloadURL: URL.init(string: (guessList?.coverLarge)!)!)
            let cache      = KingfisherManager.shared.cache
            let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                              KingfisherOptionsInfoItem.targetCache(cache)]
            
//            self.coverImage.kf.setImage(with: resource,
//                                 placeholder: UIImage(named:"find_usercover"),
//                                     options: ptionsInfo,
//                               progressBlock: nil,
//                           completionHandler: nil)
            self.coverImage.xm_setImageWithUrl(url: (guessList?.coverLarge)!, placeholder: "find_usercover")
            
            self.introLabel.text = guessList?.trackTitle
            self.titleLabel.text = guessList?.title
            
        }
    }
    

    override init (frame: CGRect){
        super.init(frame: frame)
        self.coverImage = UIImageView()
        self.addSubview(self.coverImage)
        

        self.introLabel = UILabel()
        self.introLabel.font = UIFont.systemFont(ofSize: 11.0)
        self.introLabel.numberOfLines = 0
        self.addSubview(self.introLabel)
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 10.0)
        self.titleLabel.textColor = UIColor.lightGray
        self.addSubview(self.titleLabel)
        
        self.coverImage.snp.makeConstraints { (make) -> Void in
            make.top.centerX.width.equalToSuperview()
            make.height.equalTo(self.coverImage.snp.width)
        }
        
        self.introLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.coverImage.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(3)
            make.right.equalToSuperview().offset(-3)
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
        }
        
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.introLabel.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(3)
            make.right.equalToSuperview().offset(-3)
            make.centerX.equalToSuperview()
            make.height.equalTo(14)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
