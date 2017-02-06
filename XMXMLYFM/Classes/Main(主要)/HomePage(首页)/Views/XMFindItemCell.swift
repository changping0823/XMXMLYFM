//
//  XMFindItemCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/12.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class XMFindItemCell: UICollectionViewCell {
    var titleLabel = UILabel()
    var content: UIView? {
        didSet {
            setContent()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setContent(){
        
        self.contentView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        self.contentView.addSubview(content!)
    }
}
