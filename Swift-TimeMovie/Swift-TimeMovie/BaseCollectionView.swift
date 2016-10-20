//
//  BaseCollectionView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {

    //数据数组
    var dataList:[HomeModel]?
    //单元格宽度
    var itemWith:CGFloat?
    //被观察的属性，加dynamic关键字
    //记录下标
    dynamic var currentIndex:Int = 0
    
    //初始化方法
    init(frame: CGRect, itemwith: CGFloat) {
        
        itemWith = itemwith
        //创建layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: itemwith, height: 400)
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

extension BaseCollectionView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //返回每组单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataList!.count
        
    }

    //返回单元格，在子类中复写此方法
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
        
    }
    
    //返回单元格与边缘距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0, (kScreen_W() - itemWith!)/2, 0, (kScreen_W() - itemWith!)/2)
        
    }
    
    //将要结束拖动
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //横向偏移量
        let xOffset = targetContentOffset.pointee.x
        
        //计算当前下标
        var index = Int((xOffset-10)/itemWith!)
        if index >= (dataList?.count)!-1 {
            index = (dataList?.count)! - 1
        }
        
        //偏移
        targetContentOffset.pointee.x = CGFloat(index) * itemWith! + CGFloat(index * 10)
        currentIndex = index
    }
    
    //点击单元格时调用
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //单元格显示结束时调用
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    }

}
