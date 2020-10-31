//
//  ClassifyItem.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2017/7/13.
//  Copyright © 2017年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class ClassifyItem: UICollectionViewCell {
    var leftImage : UIImageView!
    var leftLabel : UILabel!
    var splitline : UIImageView!
    var rightImage : UIImageView!
    var rightLabel : UILabel!
    var underline  : UIView!
    
    
    var categoriesList: CategoriesList? {
        didSet {
            setModel()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        
        self.leftImage = UIImageView()
        self.addSubview(self.leftImage)
        
        self.leftLabel = UILabel()
        self.leftLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.addSubview(self.leftLabel)
        
        self.splitline = UIImageView()
        self.splitline.image = UIImage(named:"find_category_rank_line")
        self.addSubview(self.splitline)
        
        let leftSpace : CGFloat = 25 * (XMScreenWidth / 320)
        
        self.leftImage.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(leftSpace)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        self.leftLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.leftImage.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        
        self.splitline.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
        }
        

        
//        self.rightImage = UIImageView()
//        self.addSubview(self.rightImage)
//        
//        
//        self.rightLabel = UILabel()
//        self.rightLabel.font = UIFont.systemFont(ofSize: 14.0)
//        self.addSubview(self.rightLabel)
//        
//        
//        self.underline = UIView()
//        self.underline.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)
//        self.addSubview(self.underline)

        
        
    }
    
    func setModel() {
        if categoriesList == nil { return }
        
        let resource   = ImageResource.init(downloadURL: URL.init(string: (categoriesList?.coverPath!)!)!)
        let cache      = KingfisherManager.shared.cache
        let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                          KingfisherOptionsInfoItem.targetCache(cache)]
        
//        leftImage.kf.setImage(with: resource,
//                              placeholder: UIImage(named:"find_usercover"),
//                              options: ptionsInfo,
//                              progressBlock: nil,
//                              completionHandler: nil)
        leftImage.xm_setImageWithUrl(url: (categoriesList?.coverPath!)!, placeholder: "find_usercover")
        
        
        leftLabel.text = categoriesList?.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
