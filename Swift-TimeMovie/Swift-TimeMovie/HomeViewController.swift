//
//  HomeViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //数据数组，添加懒加载
    lazy var dataList: [HomeModel] = {
        return []
    }()
    
    var tableView:UITableView?
    var posterView:PosterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载数据
        loadData()
        
        //加载视图
        createView()
        
        //导航栏视图
        createNaviBarItem()
        
    }
    
    //加载视图
    func createView() -> Void {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreen_W(), height: kScreen_H()-65-50), style: UITableViewStyle.plain)
        tableView?.backgroundColor = UIColor.clear
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.rowHeight = 110
        
        view.addSubview(tableView!)
        
        posterView = PosterView(frame: (tableView?.frame)!)
        posterView?.isHidden = true
        posterView?.dataList = dataList
        posterView?.backgroundColor = UIColor.clear
        
        view.addSubview(posterView!)
        
    }
    
    //加载数据
    func loadData() -> Void {
        let homeViewModel = HomeViewModel()
        weak var weakSelf = self
        homeViewModel.loadMovieData { (data) in
            weakSelf!.dataList = data
        }
    }
    
    //导航栏
    func createNaviBarItem() -> Void {
        
        //右侧按钮
        let rightBtn = UIButton(type: UIButtonType.custom)
        rightBtn.frame = CGRect(x: 0, y: 0, width: 49, height: 25)
        rightBtn.setImage(UIImage.init(named: "list_home"), for: UIControlState.normal)
        rightBtn.setBackgroundImage(UIImage.init(named: "exchange_bg_home"), for: UIControlState.normal)
        rightBtn.setImage(UIImage.init(named: "poster_home"), for: UIControlState.selected)
        rightBtn.setBackgroundImage(UIImage.init(named: "exchange_bg_home"), for: UIControlState.selected)
        //点击事件
        rightBtn.addTarget(self, action: #selector(rightBtnAction(btn:)), for: UIControlEvents.touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
    }
    
    //导航栏右侧按钮点击事件
    func rightBtnAction(btn: UIButton) -> Void {
        
        if btn.isSelected == true {
            
            btn.isSelected = !btn.isSelected
            flipWithView(view: btn, isLeft: true)
            navigationController?.navigationBar.alpha = 1
            tableView?.isHidden = false
            posterView?.isHidden = true
            
        } else {
            
            btn.isSelected = !btn.isSelected
            flipWithView(view: btn, isLeft: false)
            navigationController?.navigationBar.alpha = 0.5
            posterView?.isHidden = false
            tableView?.isHidden = true
            
        }
        
        //翻转主界面
        flipWithView(view: view, isLeft: !btn.isSelected)
        
    }
    
    //翻转动画
    func flipWithView(view: UIView,isLeft: Bool) -> Void {
        
        UIView.animate(withDuration: 0.3) { 
            UIView.setAnimationTransition(isLeft ? UIViewAnimationTransition.flipFromLeft : UIViewAnimationTransition.flipFromRight, for: view, cache: true)
        }
        
    }
    

}

//MARK ------ tableViewDelegate
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    //返回每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    //返回单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: nil, options: nil)?[0] as? HomeTableViewCell
        }
        cell?.homeModel = dataList[indexPath.row]
        
        return cell!
    }
    
}
