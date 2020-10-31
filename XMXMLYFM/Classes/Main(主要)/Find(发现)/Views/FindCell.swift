//
//  FindCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/28.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class FindCell: UITableViewCell {
    
    var leftImage : UIButton!
    var titleLabel : UILabel!
    var right_arrow :UIButton!
    var detailLabel : UILabel!
    
    
    
    
    
    var findItem : FindItem?  {
        didSet{
            
            self.leftImage.xm_setButtonImageWithUrl(url:(findItem?.coverPath)!, placeholder: "find_radio_default")
            self.titleLabel.text = findItem?.title
            self.detailLabel.text = findItem?.subtitle
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        self.leftImage = UIButton()
        self.addSubview(self.leftImage)
        
        self.titleLabel  = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(self.titleLabel)
        
        self.detailLabel = UILabel()
        self.detailLabel.font = UIFont.systemFont(ofSize: 13)
        self.detailLabel.textAlignment = NSTextAlignment.right
        self.detailLabel.textColor = RGBA(r: 200, g: 200, b: 200, a: 1)
        self.addSubview(self.detailLabel)
        
        self.right_arrow = UIButton()
        self.right_arrow.setImage(UIImage(named:"findcell_arrow"), for: .normal)
        self.addSubview(self.right_arrow)
        
        
        self.leftImage.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.left.equalTo(self.leftImage.snp.right).offset(10)
        }
        self.right_arrow.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview()
            make.width.equalTo(self.right_arrow.snp.height)
        }
        
        self.detailLabel.snp.makeConstraints { (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.titleLabel.snp.right).offset(10)
            make.right.equalTo(self.right_arrow.snp.left)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
