//
//  BaseViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

func kScreen_W() -> CGFloat { return UIScreen.main.bounds.size.width }
func kScreen_H() -> CGFloat { return UIScreen.main.bounds.size.height }

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_mtime_star.jpg")!)
        
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
