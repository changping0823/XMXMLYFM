//
//  DYHomeRecommentSectionHeaderView.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/26.
//

import UIKit

class DYHomeRecommentSectionHeaderView: UICollectionReusableView {
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
//        label.textColor = UIColor.bl
        return label
    }()
    // MARK:- 定义模型属性
    var group : DYAnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            let url = URL(string: group?.small_icon_url ?? "https://sta-op.douyucdn.cn/dycatr/9ef8ecacebe6af12af5cc8469bb64c0d.png")
            if (url != nil) {
                iconImageView.kf.setImage(with: url, placeholder: UIImage(named: "home_header_normal"))
            }else{
                iconImageView.image = UIImage(named: "home_header_normal")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize.init(width: 18, height: 18))
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
