//
//  DYHomeBaseViewCell.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/26.
//

import UIKit

class DYHomeBaseViewCell: UICollectionViewCell {
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    
    lazy var roomLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    
    lazy var coverView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var onlineBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Image_online"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11.0)
        return btn
    }()
    // MARK:- 定义模型
    var roomModel : DYRoomModel? {
        didSet {
            // 0.校验模型是否有值
            guard let roomModel = roomModel else { return }
            
            roomLabel.text = roomModel.room_name
            
            nicknameLabel.text = roomModel.nickname
            
            // 取出在线人数显示的文字
            let online = roomModel.online.intValue
            var onlineStr : String = ""
            if online >= 10000 {
                onlineStr = "\(Int(online / 10000))万在线"
            } else {
                onlineStr = "\(online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)

            guard let iconURL = URL(string: roomModel.vertical_src) else { return }
            coverView.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(roomLabel)
        self.contentView.addSubview(coverView)
        self.coverView.addSubview(nicknameLabel)
        self.coverView.addSubview(onlineBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
