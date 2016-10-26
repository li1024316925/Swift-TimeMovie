//
//  ADView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class ADView: UIView {

    var closeButton:UIButton?
    
    //图片数组，复制完成后调用
    var imageArray:[String]?{
        didSet{
            
            let scrollView = UIScrollView(frame: bounds)
            scrollView.contentSize = CGSize(width: bounds.size.width*CGFloat((imageArray?.count)!), height: bounds.size.height)
            
            for i in 0 ..< (imageArray?.count)! {
                let image = imageArray?[i]
                let imageView = UIImageView(frame: CGRect(x: bounds.size.width*CGFloat(i), y: 0, width: bounds.size.width, height: bounds.size.height))
                imageView.image = UIImage(named: image!)
                scrollView.addSubview(imageView)
            }
            
            scrollView.isPagingEnabled = true
            addSubview(scrollView)
        }
    }
    
    //按钮图片
    var closeImageStr:String?{
        didSet{
            
            closeButton = UIButton(frame: CGRect(x: bounds.size.width-50, y: 0, width: 50, height: 50))
            closeButton?.setImage(UIImage.init(named: closeImageStr!), for: UIControlState.normal)
            closeButton?.addTarget(self, action: #selector(closeBtnAction(button:)), for: UIControlEvents.touchUpInside)
            
            addSubview(closeButton!)
            
        }
    }
    
    //按钮点击方法
    func closeBtnAction(button: UIButton) -> Void {
        
        //从父视图移除并添加动画效果
        weak var weakSelf = self
        UIView.animate(withDuration: 0.5, animations: { 
            
            weakSelf!.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            weakSelf!.alpha = 0
            
            }) { (finished) in
                weakSelf!.removeFromSuperview()
        }
        
    }
    
    //初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.cornerRadius = 10;
        layer.borderWidth = 3;
        clipsToBounds = true;
        layer.borderColor = UIColor.gray.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //显示方法
    func showViewAnimation() -> Void {
        
        let window = UIApplication.shared.delegate?.window!
        window?.addSubview(self)
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        weak var weakSelf = self
        UIView.animate(withDuration: 0.7, animations: { 
            weakSelf!.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { (finished) in
                weakSelf!.transform = CGAffineTransform.identity
        }
     
        //将关闭按钮移到最上层
        bringSubview(toFront: closeButton!)
        
    }
    
}
