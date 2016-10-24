//
//  DetailView.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/19.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class DetailView: UIView {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleCN: UILabel!
    @IBOutlet weak var titleEN: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    //赋值完成后调用
    var model:HomeModel?{
        didSet{
            movieImage.sd_setImage(with: URL(string: (model?.img)!))
            titleCN.text = "片名:\((model?.titleCn)!)"
            titleEN.text = "英文名:\((model?.titleEn)!)"
            year.text = "上映时间:\((model?.rYear)!)"
            
            //可选绑定
            guard var ratingFinal = model?.ratingFinal else {
                return
            }
            if ratingFinal.floatValue <= 0 {
                ratingFinal = 0
            }
            //富文本属性
            let aStr = NSMutableAttributedString(string: String(format: "%.1f", arguments: [ratingFinal.floatValue]))
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location: 2, length: 1))
            
            ratingLabel.attributedText = aStr
            ratingView.rating = CGFloat(ratingFinal.floatValue)
            
            backgroundColor = UIColor.init(patternImage: UIImage(named: "home_top_movie_background_cover")!)
        }
    }

}
