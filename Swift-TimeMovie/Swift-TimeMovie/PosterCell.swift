//
//  PosterCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    var imageView:UIImageView?
    var detailView:DetailView?
    var isLeft:Bool = false
    
    //赋值完成后调用
    var model:HomeModel?{
        didSet{
            
            imageView?.sd_setImage(with: URL(string: (model?.img)!))
            detailView?.model = model
            
        }
    }
    
    
    //自动复用池复用时调用此方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutIfNeeded()
        //加载子视图
        imageView = UIImageView(frame: bounds)
        detailView = Bundle.main.loadNibNamed("DetailView", owner: nil, options: nil)?[0] as? DetailView
        detailView?.frame = bounds
        detailView?.isHidden = true
        
        addSubview(detailView!)
        addSubview(imageView!)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //翻转
    func flipViews() -> Void {
        
        let option = isLeft ? UIViewAnimationOptions.transitionFlipFromLeft : UIViewAnimationOptions.transitionFlipFromRight
        
        //动画效果
        weak var weakSelf = self
        UIView.transition(with: self, duration: 0.3, options: option, animations: { 
            
            if weakSelf!.isLeft{
                weakSelf!.imageView?.isHidden = false
                weakSelf!.detailView?.isHidden = true
            }else{
                weakSelf!.imageView?.isHidden = true
                weakSelf!.detailView?.isHidden = false
            }
            
            }) { (bool) in
                
                weakSelf!.isLeft = !(weakSelf!.isLeft)
                
        }
        
    }
    
    
    //此方法用于还原单元格，防止复用时出错
    func bringImageView() -> Void {
        imageView?.isHidden = false
        detailView?.isHidden = true
        isLeft = false
    }
    
}
