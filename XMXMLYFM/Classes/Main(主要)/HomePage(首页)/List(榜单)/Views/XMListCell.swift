//
//  XMListCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/27.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit
import Kingfisher

class XMListCell: UITableViewCell {

    var coverImage : UIImageView!
    var titleLabel : UILabel!
    var detailLabel1 : UILabel!
    var detailLabel2 : UILabel!
    var arrowImage : UIButton!
    
    var programList: ProgramList! {
        didSet{
            self.setData()
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.coverImage = UIImageView()
        self.coverImage.backgroundColor = RandomColor
        self.addSubview(self.coverImage)
        
        self.titleLabel = UILabel()
        self.titleLabel.font = UIFont.systemFont(ofSize:15)
        self.addSubview(self.titleLabel)
        
        self.detailLabel1 = UILabel()
        self.detailLabel1.font = UIFont.systemFont(ofSize:12)
        self.detailLabel1.textColor = RGBA(r: 180, g: 180, b: 180, a: 1)
        self.addSubview(self.detailLabel1)
        
        self.detailLabel2 = UILabel()
        self.detailLabel2.font = UIFont.systemFont(ofSize:12)
        self.detailLabel2.textColor = RGBA(r: 180, g: 180, b: 180, a: 1)
        self.addSubview(self.detailLabel2)
        
        self.arrowImage = UIButton()
        self.arrowImage.setImage(UIImage(named:"cell_arrow"), for: .normal)
        self.addSubview(self.arrowImage)
        

        self.makeConstraints()
        
    }
    
    func setData(){
        
        
        let resource   = ImageResource.init(downloadURL: URL.init(string: (programList?.coverPath!)!)!)
        let cache      = KingfisherManager.shared.cache
        let ptionsInfo = [KingfisherOptionsInfoItem.transition(ImageTransition.fade(1)),
                          KingfisherOptionsInfoItem.targetCache(cache)]
        
        coverImage.kf.setImage(with: resource,
                        placeholder: UIImage(named:"find_usercover"),
                            options: ptionsInfo,
                      progressBlock: nil,
                  completionHandler: nil)
        
        self.titleLabel.text = self.programList.title
        let result1 = self.programList.firstKResults?[0]
        let result2 = self.programList.firstKResults?[1]
        
        self.detailLabel1.text = "1 " + (result1?.title)!
        self.detailLabel2.text = "2 " + (result2?.title)!
    }
    

    
    func makeConstraints(){
        
        self.coverImage.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(self.coverImage.snp.width)
        }
        
        self.arrowImage.snp.makeConstraints { (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
            make.width.equalTo(20)
        }
        
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.coverImage)
            make.left.equalTo(self.coverImage.snp.right).offset(5)
            make.right.equalTo(self.arrowImage.snp.left)
        }
        
        self.detailLabel1.snp.makeConstraints { (make) ->Void in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(self.arrowImage.snp.left)
        }
        self.detailLabel2.snp.makeConstraints { (make) ->Void in
            make.top.equalTo(self.detailLabel1.snp.bottom).offset(5)
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(self.arrowImage.snp.left)
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
