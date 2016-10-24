//
//  CoreDataFromJson.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/17.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class CoreDataFromJson: NSObject {

    class func jsonObjectFromFileName(fileName: String) -> NSDictionary? {
        //获取文件路径
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        //解析
        let data = NSData.init(contentsOfFile: path!)
        let dic = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
        
        return dic
    }
    
    class func jsonObjectFromFileNameToArray(fileName: String) -> NSArray? {
        //获取文件路径
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        //解析
        let data = NSData.init(contentsOfFile: path!)
        let dic = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? NSArray
        
        return dic
    }
    
}
