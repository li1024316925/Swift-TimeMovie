//
//  PosterCollectionVIew.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class PosterCollectionView: BaseCollectionView {

    //复写初始化方法
    override init(frame: CGRect, itemwith: CGFloat) {
        super.init(frame: frame, itemwith: itemwith)
        
        self.backgroundColor = UIColor.clear
        //注册单元格
        register(PosterCell.classForCoder(), forCellWithReuseIdentifier: "PosterCell")
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //复写点击单元格时调用
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //判断当前点击的单元格是否为屏幕中央
        if indexPath.item == currentIndex {
            //通过indexPath取到单元格后，调用翻转方法
            let cell = collectionView.cellForItem(at: indexPath) as! PosterCell
            cell.flipViews()
        } else {
            //不是中间单元格，滑动
            scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            currentIndex = indexPath.item
        }
        
    }
    
    
    //单元格已经结束显示
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let posterCell = cell as! PosterCell
        posterCell.bringImageView()
        
    }
    
    //复写返回单元格方法
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:PosterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        cell.model = dataList?[indexPath.row]
        
        return cell
        
    }

    
    
}
