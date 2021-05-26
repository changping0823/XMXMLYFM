//
//  DYRecommendViewModel.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/25.
//

import UIKit

class DYRecommendViewModel: DYBaseViewModel {
    lazy var cycleArray = [DYCycleModel]()
    lazy var liveArray = [DYAnchorGroup]()
    fileprivate lazy var bigDataGroup : DYAnchorGroup = DYAnchorGroup()
    fileprivate lazy var prettyGroup : DYAnchorGroup = DYAnchorGroup()
}


// MARK:- 发送网络请求
extension DYRecommendViewModel {
    func requestCycleData(finishCallback : @escaping() -> ()){
        let url = "http://www.douyutv.com/api/v1/slide/6"
        //  准备参数
        let params = ["version" : "2.300"]
        Network.GET(url: url, parameters: params).success { (response) in
            
            guard let dic = response as? [String: AnyObject] else {
                print("字典格式不正确")
                return
            }
            guard let data = dic["data"] as? [[String: AnyObject]] else {
                print("字典格式不正确\(dic)")
                return
            }
            self.cycleArray = data.kj.modelArray(DYCycleModel.self)
            finishCallback()

        }.failed { (error) in
            print(error)
            finishCallback()
        }
    }
    
    
    func requestLiveData(finishCallback : @escaping() -> ()) {
        
        let liveGroup = DispatchGroup()

        
        let parameters = ["limit" : "4", "offset" : "0", "time" : Date.currentTime()]
        
        /// 热门推荐
        liveGroup.enter()
        Network.GET(url: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: parameters).success { response in
            // 1.将result转成字典类型
            guard let resultDict = response as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let array = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.1.设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_url = "home_header_hot"
            let dataArray = array.kj.modelArray(DYRoomModel.self)
            for room in dataArray{
                self.bigDataGroup.room_list.append(room)
            }
            liveGroup.leave()
        }
        
        // 请求第二部分颜值数据
        liveGroup.enter()
        Network.GET(url: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters).success { (result) in
            // 1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let array = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.遍历字典,并且转成模型对象
            // 3.1.设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_url = "home_header_phone"
            
            // 3.2.获取主播数据
            let dataArray = array.kj.modelArray(DYRoomModel.self)
            for room in dataArray{
                self.prettyGroup.room_list.append(room)
            }
            // 3.3.离开组
            liveGroup.leave()
        }
        
        /// 其他分类
        liveGroup.enter()
        Network.GET(url: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters).success { response in
            // 1.将result转成字典类型
            guard let resultDict = response as? [String : NSObject] else { return }
            
            // 2.根据data该key,获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            self.liveArray = dataArray.kj.modelArray(DYAnchorGroup.self)
            
            liveGroup.leave()
        }
        
        liveGroup.notify(queue: DispatchQueue.main) {
            self.liveArray.insert(self.prettyGroup, at: 0)
            self.liveArray.insert(self.bigDataGroup, at: 0)
            finishCallback()
        }

    }
}
