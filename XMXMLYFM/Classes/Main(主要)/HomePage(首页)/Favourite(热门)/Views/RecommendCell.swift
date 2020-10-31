//
//  RecommendCell.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class RecommendCell: UITableViewCell {

    var splitLine : UIView!
    
    
    let space : CGFloat = 10
    var itemW : CGFloat = 0
    var itemH : CGFloat = 0
    
    lazy var sectionView: RecommentSectionView = {
        let view = RecommentSectionView()
        self.addSubview(view)
        return view
    }()
    
    lazy var showView: RecommendShowView = {
        let view = RecommendShowView()
        self.addSubview(view)
        return view
    }()
    
    
    // MARK:- 模型属性
    var hotList: HotRecommendsList? {
        didSet{
            self.sectionView.hotList = hotList
            self.showView.hotList = hotList
        }
    }
    var editorRecommendAlbums: EditorRecommendAlbums? {
        didSet{
            self.sectionView.editorRecommendAlbums = editorRecommendAlbums
            self.showView.editorRecommendAlbums = editorRecommendAlbums
        }
    }
  
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
 
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.itemW = (XMScreenWidth - 10*4) / CGFloat(3)
        self.itemH = itemW + 50
        
        self.selectionStyle = .none

        
        self.splitLine = UIView()
        self.splitLine.backgroundColor = RGBA(r: 234, g: 234, b: 234, a: 1)
        self.addSubview(self.splitLine)
        
        self.sectionView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        self.showView.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.sectionView.snp.bottom)
            make.height.equalTo(itemH)
        }
        
        self.splitLine.snp.makeConstraints { (make) ->Void in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(self.showView.snp.bottom).offset(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}











