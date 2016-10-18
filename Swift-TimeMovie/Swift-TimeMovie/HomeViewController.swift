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
    
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载数据
        loadData()
        
        //加载视图
        createView()
        
    }
    
    //加载视图
    func createView() -> Void {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: kScreen_H()-65-50), style: UITableViewStyle.plain)
        tableView?.backgroundColor = UIColor.clear
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.rowHeight = 110
        
        view.addSubview(tableView!)
        
    }
    
    //加载数据
    func loadData() -> Void {
        let homeViewModel = HomeViewModel()
        weak var weakSelf = self
        homeViewModel.loadMovieData { (data) in
            weakSelf!.dataList = data
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK ------ tableViewDelegate
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    //返回每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    //返回单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: nil, options: nil)?[0] as? HomeTableViewCell
        }
        cell?.homeModel = dataList[indexPath.row]
        
        return cell!
    }
    
}
