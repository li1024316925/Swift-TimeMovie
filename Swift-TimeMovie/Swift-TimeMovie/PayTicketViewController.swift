//
//  PayTicketViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PayTicketViewController: BaseViewController {

    var tableView1:UITableView?
    var tableView2:UITableView?
    
    //正在热映数据源，懒加载
    lazy var hotNowData: [HotModel] = {
        return []
    }()
    
    //即将上映表头数据源
    lazy var willHeadData: [WillModel] = {
        return []
    }()
    
    //即将上映数据
    lazy var willDataDic: [String:[WillModel]] = {
        return [:]
    }()
    //即将上映数据个数
    var willDataCount: Int = 0
    
    //即将上映数据keys
    lazy var willDataDicKeys: [String] = {
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
        //加载数据
        loadData()
        
        //创建按钮组
        createSegmentView()
        
        //创建表视图
        createTableView()
        
    }
    
    //加载数据
    func loadData() -> Void{
        
        //正在热映数据
        PayTicketViewModel().hotNowData { (data) in
            hotNowData = data
        }
        
        //即将上映数据
        PayTicketViewModel().willNewData(headData: { (headData) in
            willHeadData = headData
            }, bodyData: { (bodyData,count) in
                willDataDic = bodyData
                willDataCount = count
            }) { (keys) in
                willDataDicKeys = keys
        }
        
    }

    //创建按钮组
    func createSegmentView() -> Void {
        
        let segView = SegmentView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50))
        segView.titleArray = ["正在热映","即将上映"]
        segView.selectImageName = "color_line"
        //按钮点击
        weak var weakSelf = self
        segView.selectAction { (index) in
            weakSelf!.tableViewMoveAction(index: index)
        }
        
        view.addSubview(segView)
        
    }
    
    //切换表视图方法
    func tableViewMoveAction(index: Int) -> Void {
        
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) { 
            weakSelf!.tableView1?.frame = CGRect(x: -kScreen_W()*CGFloat(index), y: (weakSelf!.tableView1?.frame.origin.y)!, width: (weakSelf!.tableView1?.frame.size.width)!, height: (weakSelf!.tableView1?.frame.size.height)!)
            weakSelf!.tableView2?.frame = CGRect(x: -kScreen_W()*CGFloat(index)+kScreen_W(), y: (weakSelf!.tableView2?.frame.origin.y)!, width: (weakSelf!.tableView2?.frame.size.width)!, height: (weakSelf!.tableView2?.frame.size.height)!)
        }
        
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        //正在热映表视图
        tableView1 = UITableView(frame: CGRect.init(x: 0, y: 50, width: kScreen_W(), height: kScreen_H()-50-64-50), style: UITableViewStyle.plain)
        tableView1?.backgroundColor = UIColor.clear
        tableView1?.delegate = self
        tableView1?.dataSource = self
        tableView1?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView1?.rowHeight = 120
        view.addSubview(tableView1!)
        
        //即将上映表视图
        tableView2 = UITableView(frame: CGRect.init(x: kScreen_W(), y: 50, width: kScreen_W(), height: kScreen_H()-50-64-50), style: UITableViewStyle.plain)
        tableView2?.backgroundColor = UIColor.clear
        tableView2?.delegate = self
        tableView2?.dataSource = self
        tableView2?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView2?.rowHeight = 150
        view.addSubview(tableView2!)
        
        //即将上映头视图
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 230))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 50))
        label.text = "最受关注"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = UIColor.clear
        
        let aHeader = AttentionCollectionView(frame: CGRect(x: 0, y: 50, width: kScreen_W(), height: 180))
        aHeader.dataList = willHeadData
        
        headerView.addSubview(label)
        headerView.addSubview(aHeader)
        tableView2?.tableHeaderView = headerView
        
    }

}

extension PayTicketViewController: UITableViewDelegate,UITableViewDataSource{
    
    //组数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == tableView1 {
            return 1
        } else if tableView == tableView2 {
            return willDataDicKeys.count
        }
        
        return 0
        
    }
    
    //返回每组单元格数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableView1 {
            return hotNowData.count
        } else if tableView == tableView2 {
            return willDataDic[willDataDicKeys[section]]!.count
        }
        
        return 0
        
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "hotcell") as? HotNowCell
            if cell == nil {
                cell = Bundle.main.loadNibNamed("HotNowCell", owner: nil, options: nil)![0] as? HotNowCell
            }
            cell?.image1.image = nil
            cell?.image2.image = nil
            cell?.model = hotNowData[indexPath.row]
            
            return cell!
            
        } else if tableView == tableView2 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "willcell") as? WillMovieCell
            if cell == nil {
                cell = Bundle.main.loadNibNamed("WillMovieCell", owner: nil, options: nil)![0] as? WillMovieCell
            }
            cell?.model = willDataDic[willDataDicKeys[indexPath.section]]?[indexPath.row]
            
            return cell!
            
        }
        
        return UITableViewCell()
    }
    
    //返回指定组头视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if tableView == tableView2 {
            if section == 0 {
                return 50
            } else {
                return 25
            }
        }
        
        return 0
        
    }
    
    //组头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == tableView2 {
            if section == 0 {
                
                let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 50))
                headerView.backgroundColor = UIColor(patternImage: UIImage(named: "tab_bg_all@2x")!)
                headerView.layer.cornerRadius = 10
                let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 25))
                label1.text = "  即将上映\(willDataCount)部"
                label1.textColor = UIColor.white
                let label2 = UILabel(frame: CGRect(x: 0, y: 25, width: kScreen_W(), height: 25))
                label2.text = "  0\(willDataDicKeys[section])月"
                label2.textColor = UIColor.white
                headerView.addSubview(label1)
                headerView.addSubview(label2)
                
                return headerView
                
            } else {
                
                let label = UILabel(frame: CGRect(x: 0, y: 25, width: kScreen_W(), height: 25))
                label.text = "  0\(willDataDicKeys[section])月"
                label.textColor = UIColor.white
                label.backgroundColor = UIColor(patternImage: UIImage(named: "tab_bg_all@2x")!)
                label.layer.cornerRadius = 7
                label.clipsToBounds = true
                
                return label
                
            }
        }
        
        return nil
    }
    
}
