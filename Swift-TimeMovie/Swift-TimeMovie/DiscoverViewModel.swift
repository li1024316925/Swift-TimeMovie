//
//  DiscoverViewModel.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/24.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class DiscoverViewModel: NSObject {

    //新闻数据
    func newsData(data: ([NewsModel])->()) -> Void {
        
        var dataArr:[NewsModel] = []
        
        let array = CoreDataFromJson.jsonObjectFromFileName(fileName: "find_news")?["newsList"] as? NSArray
        //可选绑定
        guard let arr = array else{
            return
        }
        for dic in arr {
            let model = NewsModel(dic: dic as! [String:Any])
            dataArr.append(model)
        }
        
        data(dataArr)
        
    }
    
    //预告数据
    func trailersData(data: ([TrailerModel])->()) -> Void {
        
        var dataArr:[TrailerModel] = []
        
        let array = CoreDataFromJson.jsonObjectFromFileName(fileName: "预告")?["trailers"] as? NSArray
        //可选绑定
        guard let arr = array else {
            return
        }
        for dic in arr {
            let model = TrailerModel(dic: dic as! [String:Any])
            dataArr.append(model)
        }
        
        data(dataArr)
        
    }
    
    //排行榜数据
    func topListData(data: ([TopListModel])->()) -> Void {
        
        var dataArr:[TopListModel] = []
        let array = CoreDataFromJson.jsonObjectFromFileName(fileName: "rank2")?["topLists"] as? NSArray
        //可选绑定
        guard let arr = array else {
            return
        }
        for dic in arr {
            let model = TopListModel(dic: dic as! [String:Any])
            dataArr.append(model)
        }
        
        data(dataArr)
        
    }
    
    //影评数据
    func criticismData(data: ([CriticismModel])->()) -> Void {
        
        var dataArr:[CriticismModel] = []
        let array = CoreDataFromJson.jsonObjectFromFileNameToArray(fileName: "criticism")
        //可选绑定
        guard let arr = array else {
            return
        }
        for dic in arr {
            let model = CriticismModel(dic: dic as! [String:Any])
            dataArr.append(model)
        }
        
        data(dataArr)
        
    }
    
}
