//
//  WBStatusUserView.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

class WBStatusUserView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(headerView)
        
        self.addSubview(nicknameLabel)
        self.addSubview(timeLabel)

        headerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        
        nicknameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerView.snp.right).offset(10)
            make.top.equalTo(headerView).offset(5)
            
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nicknameLabel)
            make.top.equalTo(nicknameLabel.snp.bottom).offset(5)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var status: WBStatus? {
        didSet {
            let url = URL(string: (status?.user?.profile_image_url)!)
            headerView.kf.setImage(with: url)
            
            nicknameLabel.text = status?.user?.screen_name
            timeLabel.text = (status?.created_at)! + (status?.sourceContent)!
        }
    }
    
    private lazy var headerView: UIImageView = {
        let header = UIImageView()
        header.layer.masksToBounds = true
        header.layer.cornerRadius = 25
        return header
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let nickname = UILabel()
        return nickname
    }()
    
    /// 时间和来源
    private lazy var timeLabel: UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 12)
        time.textColor = UIColor.systemGray
        return time
    }()
}
