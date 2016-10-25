//
//  TopListView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class TopListView: UIView {

    //表视图
    var topListTableView:UITableView?
    //数据源
    var dataList:[TopListModel] = []{
        didSet{
            
            topListTableView?.reloadData()
            
        }
    }
    
    //重写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createTableView()
        self.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        topListTableView = UITableView(frame: bounds)
        topListTableView?.delegate = self
        topListTableView?.dataSource = self
        topListTableView?.backgroundColor = UIColor.clear
        
        let headerView = Bundle.main.loadNibNamed("TopListHeaderView", owner: nil, options: nil)?[0] as? TopListHeaderView
        topListTableView?.tableHeaderView = headerView
        
        addSubview(topListTableView!)
        
    }

}

extension TopListView:UITableViewDataSource,UITableViewDelegate{
    
    //每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
        
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell?.backgroundColor = UIColor.clear
            cell?.textLabel?.textColor = UIColor.white
        }
        
        cell?.textLabel?.text = dataList[indexPath.row].topListNameCn
        
        return cell!
        
    }
    
}
