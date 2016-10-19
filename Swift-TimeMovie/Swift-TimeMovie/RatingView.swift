//
//  RatingView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/18.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class RatingView: UIView {

    var yellowView:UIView?
    
    //评分属性，复写set方法，在赋值完成后调用
    var rating:CGFloat?{
        didSet{
            
            yellowView?.frame = CGRect(x: 0, y: 0, width: frame.size.width * rating! / 10.0, height: frame.size.height)
            
        }
    }
    
    override func awakeFromNib() {
        
        loadSubViews()
        
    }

    func loadSubViews() -> Void {
        
        //获取图片
        let gray = UIImage(named: "gray")!
        let yellow = UIImage(named: "yellow")!
        
        //图片大小
        let imgHeight = gray.size.height
        let imgWidth = gray.size.width * 5.0
        
        //创建视图
        let grayView = UIView(frame: CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight))
        yellowView = UIView(frame: CGRect(x: 0, y: 0, width: imgWidth, height: imgHeight))
        
        //设置背景图片，以平铺的方式
        grayView.backgroundColor = UIColor.init(patternImage: gray)
        yellowView?.backgroundColor = UIColor.init(patternImage: yellow)
        
        self.addSubview(grayView)
        self.addSubview(yellowView!)
        
        //获取View的frame之前，要调用此方法，否则获取不到
        //立即进行布局
        layoutIfNeeded()

        //计算放大倍数
        let scaleX = frame.size.width/imgWidth
        let scaleY = frame.size.height/imgHeight
        
        //调整大小
        grayView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        yellowView?.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        
        //重定视图位置
        grayView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        yellowView?.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
    }
    
}
