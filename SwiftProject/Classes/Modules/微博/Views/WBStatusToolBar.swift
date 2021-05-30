//
//  WBStatusToolBar.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

class WBStatusToolBar: UIView {
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(r: 239, g: 239, b: 239);
        return view
    }()
    lazy var shareBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage(named: "commentlist_icon_retweet_dark"), for: .normal)
        return btn
    }()
    
    lazy var messageBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage(named: "commentlist_icon_comment_dark"), for: .normal)
        return btn
    }()
    
    lazy var praiseBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage(named: "commentlist_icon_unlike_dark"), for: .normal)
        btn.setImage(UIImage(named: "commentlist_icon_like_middle"), for: .selected)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(lineView)
        addSubview(shareBtn)
        addSubview(messageBtn)
        addSubview(praiseBtn)
        

        lineView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        shareBtn.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(praiseBtn)
        }
        messageBtn.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalTo(shareBtn.snp.right)
            make.width.equalTo(shareBtn)
        }
        
        praiseBtn.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.right.equalToSuperview()
            make.left.equalTo(messageBtn.snp.right)
            make.width.equalTo(messageBtn)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
