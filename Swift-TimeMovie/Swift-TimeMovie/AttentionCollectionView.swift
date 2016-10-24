//
//  AttentionCollectionView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/21.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class AttentionCollectionView: UICollectionView {

    var dataList: [WillModel]?
    
    //自定义初始化方法
    init(frame: CGRect) {
        //布局类
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kScreen_W(), height: 180)

        super.init(frame: frame, collectionViewLayout: layout)
        isPagingEnabled = true
        dataSource = self
        delegate = self
        backgroundColor = UIColor.clear
        
        //注册单元格
        register(UINib.init(nibName: "AttentionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "attentioncell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AttentionCollectionView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //每组单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (dataList?.count)!
        
    }
    
    //单元格
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: "attentioncell", for: indexPath) as? AttentionCell
        aCell?.model = dataList?[indexPath.item]
        
        return aCell!
        
    }
    
    //单元格与控件边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
}
