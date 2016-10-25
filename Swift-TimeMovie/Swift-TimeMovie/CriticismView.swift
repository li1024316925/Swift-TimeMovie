//
//  CommentView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class CriticismView: UIView {

    //表视图
    var criticismTableView:UITableView?
    
    //用于记录单元格展开状况，懒加载
    lazy var stateDic: [String:Int] = {
        return [:]
    }()
    
    //数据源数组
    var dataList:[CriticismModel]?{
        didSet{
            
            criticismTableView?.reloadData()
            
        }
    }
    
    //初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createTableView()
        backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //创建表视图
    func createTableView() -> Void {
        
        criticismTableView = UITableView(frame: bounds)
        criticismTableView?.dataSource = self
        criticismTableView?.delegate = self
        criticismTableView?.backgroundColor = UIColor.clear
        
        addSubview(criticismTableView!)
        
    }

}

extension CriticismView:UITableViewDataSource,UITableViewDelegate{
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let indexStr = "\(indexPath.row)"
        
        if stateDic[indexStr] != nil {
        
            //取值不为空，说明该单元格为展开状态
            let model = dataList?[indexPath.row]
            let comment = (model?.summary)! as NSString
            let rect = comment.boundingRect(with: CGSize.init(width: 414, height: 9999), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil)
            
            return rect.size.height+170+20
            
        } else {
            
            return 170
            
        }
        
    }
    
    //每组单元格个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataList?.count)!
        
    }
    
    //单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "criticismcell") as? CriticismCell
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("CriticismCell", owner: nil, options: nil)![0] as? CriticismCell
            
        }
        cell?.model = dataList?[indexPath.row]
        
        return cell!
        
    }
    
    //点击单元格
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexStr = "\(indexPath.row)"
        //如果取值为空说明为收缩状态
        if (stateDic[indexStr] == nil) {
            //赋值，表明该单元格为展开状态
            stateDic[indexStr] = 1
        } else {
            //移除，表明该单元格为收缩状态
            stateDic.removeValue(forKey: indexStr)
        }
        
        //刷新当前单元格
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
}
