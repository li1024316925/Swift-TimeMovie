//
//  IndexCollectionView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/20.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class IndexCollectionView: BaseCollectionView {

    //复写初始化方法
    override init(frame: CGRect, itemwith: CGFloat) {
        super.init(frame: frame, itemwith: itemwith)
        
        //注册单元格
        register(IndexCell.classForCoder(), forCellWithReuseIdentifier: "indexCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //复写返回单元格的方法
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let indexCell = collectionView.dequeueReusableCell(withReuseIdentifier: "indexCell", for: indexPath) as? IndexCell
        indexCell?.model = dataList?[indexPath.item]
        
        return indexCell!
    }
    

}
