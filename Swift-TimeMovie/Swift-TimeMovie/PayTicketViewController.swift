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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        
        //创建按钮组
        createSegmentView()
        
        //创建表视图
        
        
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
        
    }
    
    //创建表视图
    func createTableView() -> Void {
        
    }

}
