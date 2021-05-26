//
//  DYAnchorGroup.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/26.
//

import UIKit

class DYAnchorGroup: DYBaseModel {
//    icon_url    String    https://sta-op.douyucdn.cn/dycatr/9ef8ecacebe6af12af5cc8469bb64c0d.png
    /// 组显示的图标
    var icon_url : String = "home_header_normal"
    var small_icon_url : String = ""

//    small_icon_url    String    https://sta-op.douyucdn.cn/dycatr/039541e2b3ec892338fc3e8677a013c4.png
//    tag_name    String    英雄联盟
    var tag_name : String = ""
//    tag_id    String    1
//    push_vertical_screen    String    0
//    push_nearby    String    0
    /// 该组中对应的房间信息
//    let room: DYRoomModel = [DYRoomModel] = [DYRoomModel]()
    var room_list : [DYRoomModel] = [DYRoomModel]()
}
