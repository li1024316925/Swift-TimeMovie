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
    var titleLabel:UILabel?
    var coverView:UIView?
    var headerView:UIImageView?
    var indexCollectionView:IndexCollectionView?
    
    //赋值时调用
    var dataList:[HomeModel]?{
        didSet{
            posterCollectionView?.dataList = dataList
            indexCollectionView?.dataList = dataList
            //初值
            titleLabel?.text = dataList?[0].titleCn
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
        
        //海报
        createCollectionView()
        
        //小海报
        createHeaderView()
        
        //标题
        createTitleLabel()
        
        //笼罩
        createCoverView()
        
        //灯光
        createLight()
        
        //添加监听
        addObserver()
        
    }
    
    //海报视图
    func createCollectionView() -> Void {
        
        posterCollectionView = PosterCollectionView(frame: CGRect.init(x: 0, y: 0, width: kScreen_W(), height: frame.size.height), itemwith: kScreen_W() - 150)
        addSubview(posterCollectionView!)
        
    }
    
    //小海报
    func createHeaderView() -> Void {
        
        headerView = UIImageView(frame: CGRect(x: 0, y: -135, width: kScreen_W(), height: 155))
        headerView?.image = UIImage(named: "indexBG_home")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 5)
        headerView?.isUserInteractionEnabled = true
        
        //按钮
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: kScreen_W()/2.0-100.0/2.0+3.5, y: 130, width: 100, height: 30)
        btn.addTarget(self, action: #selector(btnAction(btn:)), for: UIControlEvents.touchUpInside)
        btn.setImage(UIImage.init(named: "down_home"), for: UIControlState.normal)
        headerView?.addSubview(btn)
        
        indexCollectionView = IndexCollectionView(frame: CGRect.init(x: 0, y: 0, width: kScreen_W(), height: 135), itemwith: 100)
        headerView?.addSubview(indexCollectionView!)
        
        addSubview(headerView!)
        
    }
    
    //片名标题
    func createTitleLabel() -> Void {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 575, width: kScreen_W(), height: 45))
        titleLabel?.backgroundColor = UIColor.clear
        titleLabel?.textColor = UIColor.gray
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        
        addSubview(titleLabel!)
        
    }
    
    //笼罩
    func createCoverView() -> Void {
        
        coverView = UIView(frame: bounds)
        coverView?.backgroundColor = UIColor.black
        coverView?.alpha = 0.5
        coverView?.isHidden = true
        
        insertSubview(coverView!, belowSubview: headerView!)
        
    }
    
    //灯光
    func createLight() -> Void {
        
        let lightView = UIImageView(frame: CGRect(x: 0, y: 10, width: 124, height: 240))
        lightView.image = UIImage(named: "light")
        addSubview(lightView)
        let lightView2 = UIImageView(frame: CGRect(x: kScreen_W()-124.0, y: 10, width: 124, height: 240))
        lightView2.image = UIImage(named: "light")
        addSubview(lightView2)
        
    }
    
    //下拉按钮点击方法
    func btnAction(btn: UIButton) -> Void {
        
        if btn.isSelected == false {
            //动画
            weak var weakSelf = self
            UIView.animate(withDuration: 0.3, animations: { 
                weakSelf!.coverView?.isHidden = false
                weakSelf!.headerView?.transform = CGAffineTransform(translationX: 0, y: 135)
                //按钮旋转
                btn.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            })
        } else {
            //还原
            weak var weakSelf = self
            UIView.animate(withDuration: 0.3, animations: { 
                weakSelf!.coverView?.isHidden = true
                weakSelf!.headerView?.transform = CGAffineTransform.identity
                btn.transform = CGAffineTransform.identity
            })
        }
     
        btn.isSelected = !btn.isSelected
    }

    //添加监听
    func addObserver() -> Void {
        
        //添加indexCollectionView的监听
        indexCollectionView?.addObserver(self, forKeyPath: "currentIndex", options: NSKeyValueObservingOptions.new, context: nil)
        
        //添加posterCollectionView的监听
        posterCollectionView?.addObserver(self, forKeyPath: "currentIndex", options: NSKeyValueObservingOptions.new, context: nil)
        
    }
    
    //观察者方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //变化后的值
        let index = change?[NSKeyValueChangeKey.newKey] as! Int
        
        //创建indexPath
        let indexPath = IndexPath(item: index, section: 0)
        
        //判断是否是currenIndex属性
        guard keyPath == "currentIndex" else {
            return
        }
        
        //判断对象的类型
        if object is PosterCollectionView {
            
            //滑动到指定单元格
            indexCollectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            
        } else if object is IndexCollectionView{
            
            //滑动到指定单元格
            posterCollectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            
        }
        
        //变换标题
        titleLabel?.text = dataList?[index].titleCn
        
    }
    
    //销毁
    deinit {
        //移除观察者
        indexCollectionView?.removeObserver(self, forKeyPath: "currentIndex")
        posterCollectionView?.removeObserver(self, forKeyPath: "currentIndex")
    }
    
}
