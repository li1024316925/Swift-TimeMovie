//
//  CriticismCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class CriticismCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    //赋值完成后调用
    var model:CriticismModel?{
        didSet{
            
            let movieImageUrl = model?.relatedObj?["image"] as! String
            movieImage.sd_setImage(with: URL(string: movieImageUrl))
            comment.text = model?.summary
            title.text = model?.title
            userImage.sd_setImage(with: URL(string: (model?.userImage)!))
            userName.text = "\((model?.nickname)!)-评"
            movieName.text = model?.relatedObj?["title"] as? String
            //评分
            let aStr = NSMutableAttributedString(string: (model?.rating)!)
            aStr.setAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 15)], range: NSRange(location: 2, length: 1))
            rating.attributedText = aStr
            
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
