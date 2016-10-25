//
//  TrailerViewController.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class TrailerViewController: UIViewController {

    var model:TrailerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = model?.videoTitle
        
        let webView = UIWebView(frame: view.bounds)
        
        //创建请求，并加载
        let request = URLRequest(url: URL(string: (model?.url)!)!)
        webView.loadRequest(request)
        
        view.addSubview(webView)
        
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
