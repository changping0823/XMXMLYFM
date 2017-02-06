//
//  RecommendShowView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/16.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class RecommendShowView: UIView {
    let space : CGFloat = 10
    var itemW : CGFloat = 0
    var itemH : CGFloat = 0
    
    
    lazy var sectionView: RecommentSectionView = {
        let view = RecommentSectionView()
        self.addSubview(view)
        return view
    }()
    
    var editorRecommendAlbums: EditorRecommendAlbums? {
        didSet{
            guard let list = editorRecommendAlbums?.list else { return }
            
            var index : Int = 0
            while self.subviews.count < list.count {
                let item = RecommentItem()
                item.tag = index
                let buttonX : CGFloat = space + (itemW + space) * CGFloat(index)
                item.frame = CGRect(x:buttonX , y:0 , width:itemW , height:itemH)
                self.addSubview(item)
                index += 1
            }
            
            var number : Int = 0
            for view in self.subviews as! [RecommentItem] {
                view.albumsList = list[number]
                number += 1
            }

        }
    }
    
    var hotList: HotRecommendsList? {
        didSet{
            
            guard let list = hotList?.list else { return }
            
            var index : Int = 0
            while self.subviews.count < list.count {
                let item = RecommentItem()
                item.tag = index
                let buttonX : CGFloat = space + (itemW + space) * CGFloat(index)
                item.frame = CGRect(x:buttonX , y:0 , width:itemW , height:itemH)
                self.addSubview(item)
                index += 1
            }
            
            var number : Int = 0
            for view in self.subviews as! [RecommentItem] {
                view.guessList = list[number]
                number += 1
            }
        }
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.itemW = (XMScreenWidth - 10*4) / CGFloat(3)
        self.itemH = itemW + 50
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
