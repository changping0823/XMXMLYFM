//
//  ListSectionView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/27.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class ListSectionView: UIView {
    var arrowImage : UIImageView!
    var titleLabel : UILabel!
    
    var titleStr: String! {
        didSet{
            self.titleLabel.text = titleStr
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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
