//
//  WBStatusCell.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

///  自定义首页微博数据的cell
class WBStatusCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //  添加控件,设置约束
    private func setupUI() {
        //  修改contentView的背景色
        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)

        
        contentView.addSubview(cardView)
        
        cardView.addSubview(userView)
        cardView.addSubview(statusView)
        cardView.addSubview(toolBar)
        
        
        cardView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.bottom.right.equalToSuperview()
        }
        
        userView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(70)
        }
        statusView.snp.makeConstraints { (make) in
            make.top.equalTo(userView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(100)
        }
        toolBar.snp.makeConstraints { (make) in
            make.top.equalTo(statusView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
    }
    //  处理微博数据的ViewModel
    var status: Status? {
        didSet {
            userView.status = status
            statusView.status = status
            
        }
    }
    
    
    
    private lazy var cardView: UIView = {
        let card = UIView()
        card.backgroundColor = UIColor.white
        return card
    }()
    
    private lazy var userView: WBStatusUserView = {
        let user = WBStatusUserView()
        return user
    }()
    
    private lazy var statusView: WBStatusContentView = {
        let status = WBStatusContentView()
        return status
    }()
    
    private lazy var toolBar: WBStatusToolBar = {
        let tool = WBStatusToolBar()
        return tool
    }()
}
