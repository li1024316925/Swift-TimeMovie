//
//  MyInfoView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/24.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class MyInfoView: UIView {

    var dataList:NSArray?
    
    //重写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //数据
        loadData()
        
        //表视图
        createTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //加载数据
    func loadData() -> Void {
        
        dataList = NSArray(contentsOfFile: Bundle.main.path(forResource: "MyInfoDataList", ofType: "plist")!)
        
    }

    //创建表视图
    func createTableView() -> Void {
        
        let myinfoTableView = UITableView(frame: bounds, style: UITableViewStyle.plain)
        myinfoTableView.delegate = self
        myinfoTableView.dataSource = self
        myinfoTableView.sectionHeaderHeight = 30
        
        let headerView = Bundle.main.loadNibNamed("MyInfoTableHeaderView", owner: nil, options: nil)![0] as? MyInfoTableHeaderView
        headerView?.view.backgroundColor = UIColor(patternImage: UIImage(named: "cinema_head_bg")!)
        myinfoTableView.tableHeaderView = headerView
        
        addSubview(myinfoTableView)
        
    }
    
}

extension MyInfoView:UITableViewDelegate,UITableViewDataSource{
    
    //组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return (dataList?.count)!
    }
    
    //每组单元格数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = dataList?[section] as? NSArray
        return arr!.count
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1")
        var cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")
        
        if indexPath.section == 0 {
            
            //数据
            let array = dataList?[indexPath.section] as? NSArray
            let dic = array![indexPath.row] as? NSDictionary
            if cell1 == nil {
                cell1 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
                cell1?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            cell1?.textLabel?.text = dic?.object(forKey: "title") as? String
            cell1?.imageView?.image = UIImage(named: (dic?.object(forKey: "image") as? String)!)
            
            return cell1!
            
        }else {
            
            let array = dataList?[indexPath.section] as? NSArray
            if cell2 == nil {
                cell2 = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell2")
                cell2?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            cell2?.textLabel?.text = array?[indexPath.row] as? String
            
            return cell2!
            
        }
        
    }
    
    //组头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
        view.backgroundColor = UIColor.gray
        
        return view
        
    }
    
}
