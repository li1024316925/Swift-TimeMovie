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
        
    }
    
    func createMainViewContorller() -> Void {
        
        let imgNames = ["home","payticket","store","discover","myinfo"]
        //创建标签控制器数组存储标签控制器名
        let viewContorllersArray = ["HomeViewContorller","PayTicketViewContorller","StoreViewContorller","DiscoverViewContorller","MyInfoViewContorller"]
        
        
        
        
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
