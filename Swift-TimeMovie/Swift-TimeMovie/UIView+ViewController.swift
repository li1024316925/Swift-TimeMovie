//
//  UIView+ViewController.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import Foundation

extension UIView{
    
    func viewController() -> UIViewController? {
        
        var next = self.next
        
        while (next != nil) {
            
            //此响应者为UIViewController，return
            if next is UIViewController {
                return next as? UIViewController
            }
            
            //继续获取下一响应者
            next = next?.next
            
        }
        
        return nil
        
    }
    
}
