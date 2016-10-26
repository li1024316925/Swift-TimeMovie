//
//  FirstViewController.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //将button隐藏
        closeButton.isHidden = true
        
        createScrollView()
        
    }

    @IBAction func closeBtnAction(_ sender: UIButton) {
        
        //显示主页面
        MainViewController().createMainViewContorller()
        
    }
    
    //设置滑动视图
    func createScrollView() -> Void {
        
        //分页
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: kScreen_W()*3, height: kScreen_H())
        
        for i in 0 ..< 3 {
            
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*kScreen_W(), y: 0, width: kScreen_W(), height: kScreen_H()))
            imageView.image = UIImage(named: String(format: "wizard%d_920.jpg", arguments: [i+1]))
            scrollView.addSubview(imageView)
            
        }
        
        
    }
    
    
}

extension FirstViewController:UIScrollViewDelegate{
    
    //已经结束减速
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //判断当前页数
        let index = Int(scrollView.contentOffset.x/kScreen_W())
        if index == 2 {
            closeButton.isHidden = false
        } else {
            closeButton.isHidden = true
        }
        
    }
    
}
