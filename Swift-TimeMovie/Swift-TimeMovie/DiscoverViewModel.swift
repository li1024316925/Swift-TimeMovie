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
    
}
