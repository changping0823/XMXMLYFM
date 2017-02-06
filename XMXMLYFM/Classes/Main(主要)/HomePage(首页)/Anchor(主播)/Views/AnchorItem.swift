//
//  AnchorItem.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class AnchorItem: UICollectionViewCell {
    var bgView : UIView!
    
    var coverImage : UIImageView!
    var nickNameLabel : UILabel!
    var describeLabel : UILabel!
    
    
    
    
    var anchor: AnchorModel? {
        didSet{
            self.coverImage.xm_setImageWithUrl(url: (anchor?.largeLogo)!, placeholder: "find_radio_default")
            self.nickNameLabel.text = anchor?.nickname
            self.describeLabel.text = anchor?.verifyTitle
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.bgView = UIView()
        self.bgView.backgroundColor = UIColor.white
        self.bgView.layer.borderWidth  = 0.5
        self.bgView.layer.borderColor  = RGBA(r: 182, g: 166, b: 132, a: 1).cgColor
        self.bgView.layer.shadowOffset = CGSize(width:2,height:3)
        self.bgView.layer.shadowColor = UIColor.gray.cgColor;
        self.bgView.layer.shadowOpacity = 0.2;//阴影透明度，默认0
        self.bgView.layer.shadowRadius = 1;//阴影半径，默认3
        self.addSubview(self.bgView)
        
        self.coverImage = UIImageView()
        self.coverImage.layer.borderWidth  = 0.3
        self.coverImage.layer.borderColor  = RGBA(r: 200, g: 200, b: 200, a: 0.6).cgColor
        self.bgView.addSubview(self.coverImage);
        
        self.nickNameLabel = UILabel()
        self.nickNameLabel.font = UIFont.systemFont(ofSize: 13)
        self.nickNameLabel.textColor = RGBA(r: 182, g: 166, b: 132, a: 1)
        self.nickNameLabel.textAlignment = NSTextAlignment.center
        self.bgView.addSubview(self.nickNameLabel)
        
        
        self.describeLabel = UILabel()
        self.describeLabel.font = UIFont.systemFont(ofSize: 12)
        self.describeLabel.textColor = RGBA(r: 180, g: 180, b: 180, a: 1)
        self.describeLabel.numberOfLines = 0
        self.addSubview(self.describeLabel)
        
        
        self.bgView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.describeLabel.snp.top)
        }
        self.nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(self.bgView)
            make.height.equalTo(30)
        }
        self.coverImage.snp.makeConstraints { (make) -> Void in
            make.top.left.equalTo(self.bgView).offset(2)
            make.right.equalTo(self.bgView).offset(-2)
            make.bottom.equalTo(self.nickNameLabel.snp.top)
        }
        
        self.describeLabel.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
