//
//  CinemaViewModel.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/24.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class CinemaViewModel: NSObject {

    var dataArr:[CinemaModel] = []
    
    //加载数据
    func loadCinemaData(data: (([CinemaModel])->())?) -> Void {
        
        let array = CoreDataFromJson.jsonObjectFromFileNameToArray(fileName: "cinema")
        //可选绑定
        guard let arr = array else {
            return
        }
        for dic in arr {
            let model = CinemaModel(dic: dic as! [String:Any])
            model.length = compers(model: model)
            dataArr.append(model)
        }
        
        //可选绑定
        if let block = data {
            block(dataArr)
        }
        
    }
    
    //按照价格排序
    func loadDataWithPrice(data: ([CinemaModel])->()) -> Void {
        
        loadCinemaData(data: nil)
        for i in 0 ..< dataArr.count-1 {
            for j in 0 ..< dataArr.count-i-1 {
                let model1 = dataArr[j]
                let model2 = dataArr[j+1]
                if (model1.minPrice?.floatValue)! > (model2.minPrice?.floatValue)! {
                    //交换位置
                    swap(&dataArr[j], &dataArr[j+1])
                }
            }
        }
        
        data(dataArr)
        
    }
    
    //按照位置排序
    func loadDataWithAddress(data: ([CinemaModel])->()) -> Void {
        
        loadCinemaData(data: nil)
        for i in 0 ..< dataArr.count-1 {
            var min = i
            var f1:Float = 0
            var f2:Float = 0
            for j in i+1 ..< dataArr.count {
                let model1 = dataArr[min]
                let model2 = dataArr[j]
                f1 = compers(model: model1)
                f2 = compers(model: model2)
                if f1>f2 {
                    min = j
                }
            }
            //交换位置
            swap(&dataArr[min], &dataArr[i])
        }
        
        data(dataArr)
        
    }
    
    //计算距离
    func compers(model: CinemaModel) -> Float {
        
        let l = pow(117.0-(model.longitude?.floatValue)!, 2)+pow(36.40-(model.latitude?.floatValue)!, 2)
        return sqrt(l)
        
    }
    
}
