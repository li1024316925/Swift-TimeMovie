//
//  HotModel.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/20.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class HotModel: BaseModel {

    var img:String? //图片
    var t:String?  //标题
    var commonSpecial:String? //评价
    var rd:String? //上映时间
    var r:NSNumber? //评分
    var nearestCinemaCount:NSNumber? //影院
    var nearestShowtimeCount:NSNumber? //场次
    var is3D:NSNumber?
    var isIMAX:NSNumber?
    var isIMAX3D:NSNumber?
    var isDMAX:NSNumber?
    var wantedCount:NSNumber? //期待
    
    //重建映射关系
    override func attributesDic(dic: [String : Any]) -> [String : String] {
        var newDic = super.attributesDic(dic: dic)
        newDic["nearestCinemaCount"] = "NearestCinemaCount"
        newDic["nearestShowtimeCount"] = "NearestShowtimeCount"
        return newDic
    }
    
    
    
}
