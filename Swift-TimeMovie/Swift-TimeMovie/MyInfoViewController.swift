//
//  MyInfoViewController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/14.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class MyInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMyInfoView()
        
    }

    func loadMyInfoView() -> Void {
        
        let myInfoView = MyInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height-60-50))
        view.addSubview(myInfoView)
        
    }

}
