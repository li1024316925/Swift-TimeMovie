//
//  DiscoverViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "actor_detail_top_background.jpg")!)
        
        //导航栏按钮组
        createSegmentView()
        
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
