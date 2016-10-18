//
//  HomeViewModel.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/18.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    //首页电影列表数据
    func loadMovieData(success: @escaping ([HomeModel])->()) -> Void {
        
        //加载Json文件
        let dataDic = CoreDataFromJson.jsonObjectFromFileName(fileName: "home_header")
        guard let dictionary = dataDic else
        {
            return
        }
        
        let array = dictionary["movies"] as? NSArray
        guard let dataArray = array else
        {
            return
        }
        
        var dataList:[HomeModel] = []
        
        for dic in dataArray {
            let model:HomeModel = HomeModel(dic: dic as! [String : Any])
            dataList.append(model)
        }
        
        success(dataList)
        
    }
    
}
