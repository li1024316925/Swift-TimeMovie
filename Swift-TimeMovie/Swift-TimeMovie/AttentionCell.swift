//
//  AttentionCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/21.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class AttentionCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actor: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var model: WillModel?{
        didSet{
            
            time.text = "\((model?.rMonth)!)月\((model?.rDay)!)日上映"
            title.text = model?.title
            movieImage.sd_setImage(with: URL(string: (model?.image)!))
            let aStr = NSMutableAttributedString(string: "\((model?.wantedCount)!)人在期待上映")
            aStr.setAttributes([NSForegroundColorAttributeName:UIColor.orange], range: NSRange(location: 0, length: aStr.length-7))
            count.attributedText = aStr
            director.text = "导演：\((model?.director)!)"
            actor.text = "主演：\((model?.actor1)!) \((model?.actor2)!)"
            type.text = model?.type
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.gray.cgColor
        button2.layer.cornerRadius = 15
        button2.clipsToBounds = true
        
    }

}
