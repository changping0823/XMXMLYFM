//
//  AnchorHeaderView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class AnchorHeaderView: UICollectionReusableView {
    
    var arrowImage : UIImageView!
    var titleLabel : UILabel!
    var moreButton : UIButton!
    
    
    
    var anchor: Anchor? {
        didSet{
            self.titleLabel.text = anchor?.title
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.addSubview(self.titleLabel)
        
        
        let logoImage = UIImage(named:"findsection_logo")
        
        self.arrowImage = UIImageView()
        self.arrowImage.image = logoImage
        self.addSubview(self.arrowImage)
        
        self.moreButton = UIButton(type: .custom)
        self.moreButton.setTitle("更多", for: .normal)
        self.moreButton.setTitleColor(UIColor.lightGray, for: .normal)
        self.moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        self.moreButton.setImage(UIImage(named:"cell_arrow"), for: .normal)
        self.moreButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -25, bottom: 0, right: 0)
        self.moreButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 0)
        self.addSubview(self.moreButton)
        
        self.arrowImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
            make.size.equalTo((logoImage?.size)!)
        }
        
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.arrowImage.snp.right).offset(5)
            make.centerY.height.equalToSuperview()
            make.width.equalTo(100)
        }
        self.moreButton.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(self.snp.height)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




