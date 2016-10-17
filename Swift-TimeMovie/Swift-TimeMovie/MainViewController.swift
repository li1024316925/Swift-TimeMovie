//
//  MainViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/13.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        
        createMainViewContorller()
        
    }
    
    func createMainViewContorller() -> Void {
        
        let imgNames = ["home","payticket","store","discover","myinfo"]
        //创建标签控制器数组存储标签控制器名
        let viewContorllersArray = ["HomeViewController","PayTicketViewController","StoreViewController","DiscoverViewController","MyInfoViewController"]
        
        var bnvVcArray:[UIViewController] = []
        
        for i in 0..<5 {
            let str = viewContorllersArray[i]
            //通过一个字符串创建控制器对象
            //获取命名空间
            //namespace在info.plist 对应的是 CFBundleExecutable,我们可以在info.plist中任意右击一行,选中Show Raw Keys/Values
            let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let uivcType = NSClassFromString(namespace + "." + str) as? UIViewController.Type
            //可选绑定
            if let type = uivcType {
                //创建
                let uiVC = type.init()
                uiVC.tabBarItem.selectedImage = UIImage(named: imgNames[i] + "_on")
                uiVC.tabBarItem.image = UIImage(named: imgNames[i])
                uiVC.title = imgNames[i]
                let bnv = BaseNavViewController(rootViewController: uiVC)
                bnvVcArray.append(bnv)
            }
        }
       
        let llqTbVC = LLQTabBarController()
        llqTbVC.tabBar.selectionIndicatorImage = UIImage(named: "选中")
        llqTbVC.tabBar.backgroundImage = UIImage(named: "tab_bg_all")
        llqTbVC.viewControllers = bnvVcArray
        
        //获取应用程序代理，设置根视图
        (UIApplication.shared.delegate!.window!)!.rootViewController = llqTbVC
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
