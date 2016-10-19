//
//  HomeTableViewCell.swift
//  Swift-TimeMovie
//
//  Created by DahaiZhang on 16/10/18.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    //赋值完成后调用
    var homeModel:HomeModel?{
        didSet{
            
            titleLable.text = homeModel?.titleCn
            imgView.sd_setImage(with: URL(string: (homeModel?.img)!))
            
            //可选绑定
            guard var ratingFinal = homeModel?.ratingFinal else {
                return
            }
            if ratingFinal.floatValue <= 0 {
                ratingFinal = 0
            }
            //富文本属性
            let aStr = NSMutableAttributedString(string: String(format: "%.1f", arguments: [ratingFinal.floatValue]))
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location: 2, length: 1))
            
            ratingLable.attributedText = aStr
            ratingView.rating = CGFloat(ratingFinal.floatValue)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
