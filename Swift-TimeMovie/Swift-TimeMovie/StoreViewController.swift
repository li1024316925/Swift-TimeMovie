//
//  StoreViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController {

    //表视图
    var cinemaTableView:UITableView?
    //筛选视图
    var bottomView:BottomView?
    
    //数据源数组，懒加载
    lazy var dataList: [CinemaModel] = {
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "window")!)
        
        //加载数据
        loadData()
        
        //上部按钮
        createSegmentView()
        
        //创建表视图
        createTableView()
        
        //筛选
        createBottomView()
        
    }

    //加载数据
    func loadData() -> Void {
        weak var weakSelf = self
        CinemaViewModel().loadCinemaData { (data) in
            weakSelf!.dataList = data
        }
    }
    
    //上部按钮
    func createSegmentView() -> Void {
        let segmentView = SegmentView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50))
        segmentView.titleArray = ["全部","附近","价格","筛选"]
        segmentView.selectImageName = "icon_slider_min@2x"
        //按钮点击事件
        weak var weakSelf = self
        segmentView.selectAction { (index) in
            //首先还原底部筛选视图
            weakSelf!.moveBottomView(pop: false)
            switch index{
                case 0:
                    weakSelf!.loadData()
                case 1:
                    //按照位置排序
                    CinemaViewModel().loadDataWithAddress(data: { (data) in
                        weakSelf!.dataList = data
                    })
                case 2:
                    //按照价格排序
                    CinemaViewModel().loadDataWithPrice(data: { (data) in
                        weakSelf!.dataList = data
                    })
                case 3:
                    //弹出底部筛选视图
                    weakSelf!.moveBottomView(pop: true)
                default:
                    print("")
            }
            //刷新表视图
            weakSelf!.cinemaTableView?.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            weakSelf!.cinemaTableView?.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
            
        }
        view.addSubview(segmentView)
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        cinemaTableView = UITableView(frame: CGRect.init(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height-160), style: UITableViewStyle.plain)
        cinemaTableView?.delegate = self
        cinemaTableView?.dataSource = self
        cinemaTableView?.backgroundColor = UIColor.clear
        cinemaTableView?.rowHeight = 150
        
        view.addSubview(cinemaTableView!)
        
    }
    
    //筛选视图
    func createBottomView() -> Void {
        
        bottomView = BottomView(frame: CGRect(x: 0, y: kScreen_H()+150, width: kScreen_W(), height: 400))
        view.addSubview(bottomView!)
        
    }
    
    //弹出/隐藏筛选
    func moveBottomView(pop: Bool) -> Void {
        
        let transfrom = pop ? CGAffineTransform(translationX: 0, y: -500-113) : CGAffineTransform.identity
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) { 
            weakSelf!.bottomView?.transform = transfrom
        }
        
    }

}

extension StoreViewController: UITableViewDelegate,UITableViewDataSource{
    
    //每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataList.count
        
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cinemacell") as? CinemaCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("CinemaCell", owner: nil, options: nil)![0] as? CinemaCell
        }
        cell?.model = dataList[indexPath.row]
        
        return cell!
        
    }
    
    //单元格结束显示
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //遍历所有子视图，还原所有更改
        for view in cell.contentView.subviews {
            if view is UIImageView {
                view.transform = CGAffineTransform.identity
                view.isHidden = false
            }
        }
        
    }
    
}
