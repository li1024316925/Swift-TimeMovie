//
//  HomeViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //数据数组，添加懒加载
    lazy var dataList: [HomeModel] = {
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    //加载Json文件
    func loadData() -> Void {
        
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
        
        for dic in dataArray {
            let model:HomeModel = HomeModel(dic: dic as! [String : Any])
            self.dataList.append(model)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
