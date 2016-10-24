//
//  WillMovieCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/21.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class WillMovieCell: UITableViewCell {


    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    //赋值完成后调用
    var model: WillModel?{
        didSet{
            
            time.text = "\((model?.rDay)!)日"
            movieImage.sd_setImage(with: URL(string: (model?.image)!))
            title.text = model?.title
            type.text = model?.type
            director.text = model?.director
            let aStr = NSMutableAttributedString(string: "\((model?.wantedCount)!)人在期待上映")
            aStr.setAttributes([NSForegroundColorAttributeName:UIColor.orange], range: NSRange(location: 0, length: aStr.length-6))
            aStr.setAttributes([NSForegroundColorAttributeName:UIColor.blue], range: NSRange(location: aStr.length-6, length: 6))
            count.attributedText = aStr
            
            button2.layer.cornerRadius = 10
            button2.layer.borderWidth = 2
            button2.layer.borderColor = UIColor.gray.cgColor
            button2.clipsToBounds = true
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
