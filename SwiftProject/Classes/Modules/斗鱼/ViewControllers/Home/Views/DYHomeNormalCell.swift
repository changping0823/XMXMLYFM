//
//  DYHomeNormalCell.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/26.
//

import UIKit

class DYHomeNormalCell: DYHomeBaseViewCell {
    lazy var iconImageView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = UIImage(named: "home_live_cate_normal")
        return iconView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize.init(width: 14.0, height: 14.0))
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        
        roomLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView);
            make.left.equalTo(iconImageView.snp.right).offset(5)
            make.right.lessThanOrEqualToSuperview()
        }
        
        coverView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(iconImageView.snp.top).offset(-5)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.bottom.equalTo(coverView).offset(-5)
        }
        
        onlineBtn.snp.makeConstraints { make in
            make.centerY.equalTo(nicknameLabel)
            make.right.equalToSuperview().offset(-5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
