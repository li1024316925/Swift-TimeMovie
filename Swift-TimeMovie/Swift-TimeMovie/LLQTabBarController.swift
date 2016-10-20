//
//  LLQTabBarController.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/13.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

func kTabBarWidth(object: UITabBarController) -> CGFloat {return object.tabBar.frame.size.width}
func kTabBarHeight(object: UITabBarController) -> CGFloat {return object.tabBar.frame.size.height}
func kButtonWidth(object: UITabBarController) -> CGFloat {return kTabBarWidth(object: object)/CGFloat((object.viewControllers?.count)!)}

class LLQTabBarController: UITabBarController {

    var selectImgV:UIImageView? //存储选中图片
    //按钮数组
    lazy var tabBarButtons:[UIButton] = {
       return []
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //检查是否有选中图片
        let selectionIndicatorImage = tabBar.selectionIndicatorImage
        
        //如果没有选中图片，什么都不做，如果有添加为选中图片
        if selectionIndicatorImage == nil {
            return
        }
        
        selectImgV = UIImageView(image: selectionIndicatorImage)
        selectImgV?.frame = CGRect(x: CGFloat(selectedIndex)*kButtonWidth(object: self), y: 0, width: kButtonWidth(object: self), height: kTabBarHeight(object: self))
        tabBar.insertSubview(selectImgV!, at: 0)
        
        let selectButton = tabBarButtons[selectedIndex]
        selectButton.isSelected = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //截取外部给本控制器控制器数组赋值的方法
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        //移除所有原按钮
        for subView in tabBar.subviews {
            subView.removeFromSuperview()
        }
        
        //添加自定义的按钮
        for i in 0..<viewControllers!.count {
            let button = VerticalButton(frame: CGRect(x: CGFloat(i)*kButtonWidth(object: self), y: 0, width: kButtonWidth(object: self), height: kTabBarHeight(object: self)))
            //取出控制器，获取其tabBar的默认、选中图片、标题
            let subVC = viewControllers?[i]
            let image = subVC?.tabBarItem.image
            let selectImage = subVC?.tabBarItem.selectedImage
            let title = subVC?.tabBarItem.title
            
            //重新赋值给自定义的Button
            button.setImage(image, for: UIControlState.normal)
            button.setImage(selectImage, for: UIControlState.selected)
            button.setTitle(title, for: UIControlState.normal)
            
            //按钮添加点击事件
            button.addTarget(self, action: #selector(selectedVC(button:)), for: UIControlEvents.touchUpInside)
            button.tag = 100+i
        
            print(button)
            
            tabBar.addSubview(button)
            tabBarButtons.append(button)
        }
        
    }
    
    //MARK: ------ 按钮点击事件
    func selectedVC(button: UIButton) -> Void {
        //修改标签控制器的本身具有的 selectedIndex 完成切换功能
        selectedIndex = button.tag - 100
        
        //将除了选中的按钮全部改为非选中
        for btn in tabBarButtons {
            btn.isSelected = false
        }
        button.isSelected = true
        
        //切换控制器选中图片的动画
        //防止循环引用
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3) { 
            weakSelf!.selectImgV?.frame = CGRect(x: CGFloat(weakSelf!.selectedIndex)*kButtonWidth(object: weakSelf!), y: (weakSelf!.selectImgV?.frame.origin.y)!, width: (weakSelf!.selectImgV?.frame.size.width)!, height: (weakSelf!.selectImgV?.frame.size.height)!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

//子类化一个按钮
class VerticalButton: UIButton {
    
    var subLable:UILabel? //按钮标题
    var subImageView:UIImageView? //按钮的图片视图
    var normalImg:UIImage? //保存默认图片
    var selectImg:UIImage? //保存选中图片
    
    
    //重写带frame参数的init构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //按钮标题
        subLable = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*0.3))
        subLable?.textAlignment = NSTextAlignment.center
        subLable?.textColor = UIColor.white
        subLable?.font = UIFont.systemFont(ofSize: 12)
        
        self.addSubview(subLable!)
        
        //按钮图片
        subImageView = UIImageView(frame: CGRect(x: 0, y: (subLable?.frame.size.height)!, width: frame.size.width, height: frame.size.height*0.7))
        subImageView?.contentMode = UIViewContentMode.center
        
        self.addSubview(subImageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //截获按钮的点击状态的赋值方法，在点击状态发生改变的时候做一些操作
    override var isSelected: Bool{
        didSet{
            if isSelected == true {
                subImageView?.image = selectImg
            }else if isSelected == false {
                subImageView?.image = normalImg
            }
        }
    }
    
    //重写按钮添加图片的方法
    override func setImage(_ image: UIImage?, for state: UIControlState) {
        if state == UIControlState.normal {
            //保存默认状态下的图片，并设置渲染模式为图片原始状态
            normalImg = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            subImageView?.image = normalImg
        }else if state == UIControlState.selected {
            //保存选中状态下的图片
            selectImg = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
    }
    
    //重写按钮添加标题的方法
    override func setTitle(_ title: String?, for state: UIControlState) {
        if state == UIControlState.normal {
            subLable?.text = title
        }
    }
    
}
