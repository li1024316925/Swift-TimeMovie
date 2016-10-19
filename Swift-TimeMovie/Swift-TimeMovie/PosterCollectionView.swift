//
//  PosterCollectionVIew.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PosterCollectionView: BaseCollectionView {

    override init(frame: CGRect, itemwith: CGFloat) {
        super.init(frame: frame, itemwith: itemwith)
        
        self.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
