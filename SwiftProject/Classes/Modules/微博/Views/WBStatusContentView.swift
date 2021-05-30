//
//  WBStatusContentView.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/14.
//

import UIKit

class WBStatusContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var status: Status? {
        didSet {
            let attr = EmojiPrase.emojiAttr(emojiText: status?.text ?? "", font: contentLabel.font)
            contentLabel.attributedText = attr
        }
    }
    
    private lazy var contentLabel: UILabel = {
        let content = UILabel()
        content.numberOfLines = 0
        return content
    }()

}
