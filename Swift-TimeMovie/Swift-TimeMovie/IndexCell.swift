//
//  IndexCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/20.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class IndexCell: UICollectionViewCell {
    
    var imageView:UIImageView?
    var model:HomeModel?{
        didSet{
            imageView?.sd_setImage(with: URL(string: (model?.img)!))
        }
    }
    
    //复用时会调用此方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: bounds)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        addSubview(imageView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
