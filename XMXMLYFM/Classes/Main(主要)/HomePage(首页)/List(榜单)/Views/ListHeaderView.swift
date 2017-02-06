//
//  ListHeaderView.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/27.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class ListHeaderView: RecommendHeaderView {
    
    var listFocusImages : NSArray? {
        didSet{
            guard let specialList = listFocusImages else { return }
            
            for index in 0..<specialList.count {
                let image:RankFocusImageModel = specialList[index] as! RankFocusImageModel
                imageArray.append(image.pic!)
            }
            self.cycleScrollView.imageUrls = self.imageArray
        }
    }

}
