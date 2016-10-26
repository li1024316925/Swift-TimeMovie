//
//  TrailerView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class TrailerView: UIView {

    var trailerTableView:UITableView?
    var headerView:UIImageView?

    //数据源数组，赋值完成后调用
    var dataList:[TrailerModel]?{
        didSet{
            
            createHeaderView()
            trailerTableView?.reloadData()
            
        }
    }
    
    //复写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //创建表视图
        createTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        trailerTableView = UITableView(frame: bounds)
        trailerTableView?.delegate = self
        trailerTableView?.dataSource = self
        trailerTableView?.backgroundColor = UIColor.clear
        trailerTableView?.rowHeight = 120
        
        addSubview(trailerTableView!)
        
    }
    
    //创建表头视图
    func createHeaderView() -> Void {
        
        let model = dataList?[0]
        headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 255))
        headerView?.sd_setImage(with: URL(string: (model?.coverImg)!))
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: 255))
        view.addSubview(headerView!)
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: (headerView?.bounds.size.height)!-50, width: kScreen_W(), height: 50))
        textLabel.text = model?.movieName
        textLabel.textColor = UIColor.white
        textLabel.backgroundColor = UIColor(white: 0, alpha: 0.4)
        textLabel.font = UIFont.systemFont(ofSize: 25)
        textLabel.textAlignment = NSTextAlignment.center
        headerView?.addSubview(textLabel)
        
        //添加一个点击事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
        view.addGestureRecognizer(tap)
        
        trailerTableView?.tableHeaderView = view
        
    }
    
    //表头视图点击事件
    func tapAction(tap: UITapGestureRecognizer) -> Void {
        
        //创建VC
        let trailerVC = TrailerViewController()
        trailerVC.model = dataList?[0]
        //隐藏标签栏
        trailerVC.hidesBottomBarWhenPushed = true
        
        viewController()?.navigationController?.pushViewController(trailerVC, animated: true)
        
    }
    
}

extension TrailerView:UITableViewDelegate,UITableViewDataSource{
    
    //每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataList?.count)! - 1
        
    }
    
    //返回单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TrailerCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("TrailerCell", owner: nil, options: nil)![0] as? TrailerCell
        }
        cell?.model = dataList?[indexPath.row+1]
        
        return cell!
        
    }
    
    //点击单元格时调用
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //创建VC
        let trailerVC = TrailerViewController()
        trailerVC.model = dataList?[indexPath.row+1]
        //隐藏标签栏
        trailerVC.hidesBottomBarWhenPushed = true
        
        viewController()?.navigationController?.pushViewController(trailerVC, animated: true)
        
    }
    
    //滑动过程中调用
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let fy = -scrollView.contentOffset.y
        let hight = trailerTableView?.tableHeaderView?.frame.size.height
        
        //向下滑动时
        if scrollView.contentOffset.y < 0 {
            
            headerView?.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            headerView?.layer.position = CGPoint(x: (trailerTableView?.tableHeaderView?.center.x)!, y: 255)
            
            headerView?.transform = CGAffineTransform(scaleX: (fy+hight!)/hight!, y: (fy+hight!)/hight!)
            
        }
        
    }
    
}
