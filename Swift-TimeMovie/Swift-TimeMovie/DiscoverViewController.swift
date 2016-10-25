//
//  DiscoverViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    //新闻视图
    var newsView:NewsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "actor_detail_top_background.jpg")!)
        
        //导航栏按钮组
        createSegmentView()
        
        //创建视图
        createView()
        
    }
    
    //创建视图
    func createView() -> Void {
        
        //新闻
        createNewsView()
        
    }
    
    //新闻
    func createNewsView() -> Void {
        
        newsView = NewsView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: kScreen_H()-50-10-50))
        //数据
        weak var weakSelf = self
        DiscoverViewModel().newsData { (data) in
            weakSelf!.newsView?.dataList = data
        }
        view.addSubview(newsView!)
        
    }

    //按钮组
    func createSegmentView() -> Void {
        
        let segmentView = SegmentView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 50))
        segmentView.titleArray = ["新闻","预告片","排行榜","影评"]
        segmentView.selectAction { (index) in
            
        }
        navigationItem.titleView = segmentView
        
    }
    
}
