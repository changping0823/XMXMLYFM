//
//  XMFindToolBarCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/8.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class XMFindToolBarCell: UICollectionViewCell {
    var titleButton :UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.titleButton = UIButton(type:.custom)
        self.titleButton.setTitleColor(UIColor.darkGray, for:.normal)
        self.titleButton.setTitleColor(UIColor.red, for:.selected)
        self.titleButton.isUserInteractionEnabled = false
        self.titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.9)
        addSubview(self.titleButton!)
        
        if self.isSelected {
            self.backgroundColor = UIColor.yellow
        }else{
            self.backgroundColor = UIColor.white
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleButton.frame = self.bounds
    }
    
}
