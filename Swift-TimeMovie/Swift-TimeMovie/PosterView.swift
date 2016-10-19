//
//  PosterView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PosterView: UIView {

    var posterCollectionView:PosterCollectionView?
    
    //赋值时调用
    var dataList:[HomeModel]?{
        didSet{
            posterCollectionView?.dataList = dataList
        }
    }
    
    //复写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutIfNeeded()
        loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //加载子视图
    func loadSubviews() -> Void {
        
        createCollectionView()
        
    }
    
    //海报视图
    func createCollectionView() -> Void {
        
        posterCollectionView = PosterCollectionView(frame: CGRect.init(x: 0, y: 0, width: kScreen_W(), height: frame.size.height), itemwith: kScreen_W() - 150)
        addSubview(posterCollectionView!)
        
    }
    

}
