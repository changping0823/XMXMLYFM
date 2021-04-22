//
//  HomeCell.swift
//  SwiftProject
//
//  Created by ren on 2020/11/12.
//

import UIKit
import SnapKit
import Kingfisher


class HomeCell: UITableViewCell {
    weak var delegate: HomeCellDelegate?
    
    var iconView : UIImageView!
    var titleLabel : UILabel!
    var zanbtn: UIButton!
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        iconView = UIImageView()
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 4.0
        contentView.addSubview(iconView)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        contentView.addSubview(titleLabel)
        
        zanbtn = UIButton.init(type: .custom)
        zanbtn.backgroundColor = .red
        zanbtn.addTarget(self, action: #selector(zanbtnClick(sender:)), for: .touchUpInside)
        contentView.addSubview(zanbtn)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(16)
            make.size.equalTo(CGSize.init(width: 80, height: 80))
            make.bottom.equalTo(contentView).offset(-10).priority(.high)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView)
            make.left.equalTo(iconView.snp_rightMargin).offset(10)
            make.right.equalTo(contentView).offset(-16)
        }
        
        zanbtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 30))
            make.bottom.right.equalToSuperview()
        }
        

    }
    
    func sum(num1: Int, num2: Int) -> Int {
        num1 + num2
    }
    
    
    func setModel(model: HomeModel) {
        self.titleLabel.text = model.content
        self.iconView.kf.setImage(with: URL(string: model.user.thumb))
    }
    
    @objc func zanbtnClick(sender:UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.backgroundColor = .blue
        }else{
            sender.backgroundColor = .red
        }
        
        self.delegate?.zanAction(sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol HomeCellDelegate: NSObjectProtocol {
    func zanAction(_ sender: UIButton)
}

