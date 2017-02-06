//
//  ClassifyCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class ClassifyCell: UITableViewCell {
    
    var leftImage : UIImageView!
    var leftLabel : UILabel!
    var splitline : UIImageView!
    var rightImage : UIImageView!
    var rightLabel : UILabel!
    var underline  : UIView!
    
    
    
    var leftModel: CategoriesList? {
        didSet {
            setLeftModel()
        }
    }
    var rightModel: CategoriesList? {
        didSet {
            setRightModel()
        }
    }
    
    var list = Array<CategoriesList>() {
        didSet{
            print("\(list)")
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.leftImage = UIImageView()
        self.addSubview(self.leftImage)
        
        self.leftLabel = UILabel()
        self.leftLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.addSubview(self.leftLabel)
        
        self.splitline = UIImageView()
        self.splitline.image = UIImage(named:"find_category_rank_line")
        self.addSubview(self.splitline)
        
        self.rightImage = UIImageView()
        self.addSubview(self.rightImage)
        
        
        self.rightLabel = UILabel()
        self.rightLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.addSubview(self.rightLabel)
        
        
        self.underline = UIView()
        self.underline.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)
        self.addSubview(self.underline)
        
        
        
        
        let leftSpace : CGFloat = 25 * (XMScreenWidth / 320)
        
        self.leftImage.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(leftSpace)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        self.leftLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.leftImage.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        
        self.splitline.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
        }
        
        self.rightImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.splitline.snp.right).offset(leftSpace)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        self.rightLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.rightImage.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        
        self.underline.snp.makeConstraints { (make) -> Void in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
    }
    
    
    
    
    
    
    func setLeftModel() {
        if leftModel == nil { return }
        
        let resource   = ImageResource.init(downloadURL: URL.init(string: (leftModel?.coverPath!)!)!)
        let cache      = KingfisherManager.shared.cache
        let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                          KingfisherOptionsInfoItem.targetCache(cache)]
        
        leftImage.kf.setImage(with: resource,
                       placeholder: UIImage(named:"find_usercover"),
                           options: ptionsInfo,
                     progressBlock: nil,
                 completionHandler: nil)
        
        
        
        leftLabel.text = leftModel?.title
        
    }
    
    
    func setRightModel() {
        if rightModel == nil { return }
        let resource   = ImageResource.init(downloadURL: URL.init(string: (rightModel?.coverPath!)!)!)
        let cache      = KingfisherManager.shared.cache
        let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                          KingfisherOptionsInfoItem.targetCache(cache)]
        
        rightImage.kf.setImage(with: resource,
                        placeholder: UIImage(named:"find_usercover"),
                            options: ptionsInfo,
                      progressBlock: nil,
                  completionHandler: nil)
        
        
        
        rightLabel.text = rightModel?.title

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
