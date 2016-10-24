//
//  PayTicketViewModel.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/20.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PayTicketViewModel: NSObject {
    
    //正在热映数据
    func hotNowData(data: ([HotModel])->()) -> Void {
        
        var dataArray:[HotModel] = []
        
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "buy_now")
        let array = dataDic?["ms"] as! [[String:Any]]
        for dic in array {
            let model = HotModel(dic: dic)
            dataArray.append(model)
        }
        
        data(dataArray)
        
    }
    
    //即将上映数据
    func willNewData(headData: ([WillModel])->(), bodyData: ([String:[WillModel]],Int)->(), bodyKeys: ([String])->()) -> Void {
        
        var dataArray:[WillModel] = []
        var bodyDataDic:[String:[WillModel]] = [:]
        
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "buy_new")
        let array1 = dataDic?["attention"] as! [[String:Any]]
        let array2 = dataDic?["moviecomings"] as! [[String:Any]]
        
        //头视图数据
        for dic in array1 {
            let model = WillModel(dic: dic)
            dataArray.append(model)
        }
        headData(dataArray)
        
        //表数据
        for dic in array2 {
            let model = WillModel(dic: dic)
            //按照月份排序
            let key = String(format: "%d", arguments: [(model.rMonth?.intValue)!])
            var array = bodyDataDic[key]
            if array == nil {
                var newArr:[WillModel] = []
                newArr.append(model)
                bodyDataDic[key] = newArr
            } else {
                array!.append(model)
                bodyDataDic[key] = array
            }
        }
        bodyData(bodyDataDic,array2.count)
        
        let arr = Array(bodyDataDic.keys)
        let keysArray = arr.sorted()
        bodyKeys(keysArray)
    }
    
}
