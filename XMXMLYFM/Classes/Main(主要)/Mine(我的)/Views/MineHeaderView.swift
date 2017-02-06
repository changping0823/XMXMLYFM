//
//  MineHeaderView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/29.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
//import UIButton+GL_EXTENSIONS
let HeaderWH : CGFloat = 60
let buttonH :CGFloat = 50



class MineHeaderView: UIView {
    
    var headerButton : UIButton!
    var nickNameLabel : UILabel!
    var detailLabel : UILabel!
    
    var centerView : UIView!
    var historyButton : UIButton!
    var dingyueButton : UIButton!
    var xiazaiButton : UIButton!
    
    var recordButton : UIButton!
    var manageButton : UIButton!
    var bottomView : UIView!
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        self.headerButton = UIButton(type:.custom)
        self.headerButton.setImage(UIImage(named:"me"), for: .normal)
        self.headerButton.layer.masksToBounds = true
        self.headerButton.layer.borderWidth = 2
        self.headerButton.layer.cornerRadius = HeaderWH * 0.5
        self.headerButton.layer.borderColor = RGBA(r: 180, g: 180, b: 180, a: 1).cgColor
        self.addSubview(self.headerButton)
        
        self.nickNameLabel = UILabel()
        self.nickNameLabel.text = "点击登录"
        self.nickNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.nickNameLabel.textColor = UIColor.white
        self.addSubview(self.nickNameLabel)
        
        self.detailLabel = UILabel()
        self.detailLabel.text = "1秒登录，专享个性化服务"
        self.detailLabel.font = UIFont.systemFont(ofSize: 12)
        self.detailLabel.textColor = UIColor.white
        self.addSubview(self.detailLabel)
        
        self.centerView = UIView()
        self.centerView.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        self.addSubview(self.centerView)
        
        self.historyButton = createButton(image: "My_icon_history", title: "历史", tag: 110)
        self.dingyueButton = createButton(image: "My_icon_RSS", title: "订阅", tag: 119)
        self.xiazaiButton  = createButton(image: "My_icon_download", title: "下载", tag: 120)
        
        self.bottomView = UIView()
        self.bottomView.backgroundColor = RGBA(r: 235, g: 235, b: 235, a: 1)
        self.addSubview(self.bottomView)
        self.recordButton = createBottomButton(image: "ic_button_rec_w", title: "开始录音", tag: 1001)
        self.recordButton.isSelected = true
        self.manageButton = createBottomButton(image: "ic_jmgl-1", title: "节目管理", tag: 1002)

        self.makeConstraints()
        
        
    }
    
    
    func createButton(image:String,title:String,tag:Int) -> UIButton {
        let button = UIButton(type:.custom)
        button.setImage(UIImage(named:image), for: .normal)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setImagePosition(XMImagePosition.top, spacing: 5)
        self.centerView.addSubview(button)
        return button
    }
    
    func createBottomButton(image:String,title:String,tag:Int) -> UIButton {
        
        let button = UIButton(type:.custom)
        button.layer.masksToBounds = true
        button.setImage(UIImage(named:image), for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setBackgroundImage(UIImage().creatImageWithColor(color: UIColor.white), for: .normal)
        button.setBackgroundImage(UIImage().creatImageWithColor(color: RGBA(r: 238, g: 100, b: 70, a: 1)), for: .selected)
        self.bottomView.addSubview(button)
        return button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.recordButton.layer.cornerRadius = self.recordButton.height * 0.5
        self.manageButton.layer.cornerRadius = self.manageButton.height * 0.5
    }

    
    
    
    
    func makeConstraints(){
        self.headerButton.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(HeaderWH)
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(30+XMNavHeight)
        }
        self.nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.headerButton.snp.right).offset(10)
            make.bottom.equalTo(self.headerButton.snp.centerY).offset(-3)
        }
        self.detailLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.headerButton.snp.right).offset(10)
            make.top.equalTo(self.headerButton.snp.centerY).offset(3)
            
        }
        
        
        self.centerView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.headerButton.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        self.historyButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.centerView).offset(10)
            make.left.bottom.equalTo(self.centerView)
            make.right.equalTo(self.dingyueButton.snp.left)
            make.width.equalTo(self.dingyueButton.snp.width)
        }
        self.dingyueButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.centerView).offset(10)
            make.bottom.equalTo(self.centerView)
            make.left.equalTo(self.historyButton.snp.right)
            make.right.equalTo(self.xiazaiButton.snp.left)
            make.width.equalTo(self.xiazaiButton.snp.width)
        }
        self.xiazaiButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.centerView).offset(10)
            make.right.bottom.equalTo(self.centerView)
            make.left.equalTo(self.dingyueButton.snp.right)
            make.width.equalTo(self.historyButton.snp.width)
        }
        
        
        
        self.bottomView.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(100)
        }
        self.recordButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.bottomView).offset(10)
            make.left.top.equalTo(self.bottomView).offset(15)
            make.right.equalTo(self.bottomView).offset(-15)
            make.bottom.equalTo(self.manageButton.snp.top).offset(-10)
        }
        self.manageButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.bottomView).offset(15)
            make.right.equalTo(self.bottomView).offset(-15)
            make.bottom.equalTo(self.bottomView).offset(-10)
            make.height.equalTo(self.recordButton.snp.height)
        }
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
