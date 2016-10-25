//
//  NewsCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    //cell1
    @IBOutlet weak var imageCell1: UIImageView!
    @IBOutlet weak var titleCell1: UILabel!
    @IBOutlet weak var title2Cell1: UILabel!
    @IBOutlet weak var timeCell1: UILabel!
    @IBOutlet weak var commentCell1: UILabel!
    
    //cell2    
    @IBOutlet weak var titleCell2: UILabel!
    @IBOutlet weak var timeCell2: UILabel!
    @IBOutlet weak var commentCell2: UILabel!
    @IBOutlet weak var image1Cell2: UIImageView!
    @IBOutlet weak var image2Cell2: UIImageView!
    @IBOutlet weak var image3Cell2: UIImageView!
    
    
    //赋值时调用
    var model:NewsModel?{
        didSet{
            
            if model?.type == 1 {
                
                //cell2
                titleCell2.text = model?.title
                let dic1 = model?.images?[0] as? [String:Any]
                let dic2 = model?.images?[1] as? [String:Any]
                let dic3 = model?.images?[2] as? [String:Any]
                image1Cell2.sd_setImage(with: URL(string: (dic1?["url1"] as? String)!))
                image2Cell2.sd_setImage(with: URL(string: (dic2?["url1"] as? String)!))
                image3Cell2.sd_setImage(with: URL(string: (dic3?["url1"] as? String)!))
                timeCell2.text = "4小时前评论"
                commentCell2.text = "\((model?.commentCount)!)条评论"
                
            }else{
                
                //cell1
                timeCell1.text = "4小时前评论"
                titleCell1.text = model?.title
                title2Cell1.text = model?.title2
                imageCell1.sd_setImage(with: URL(string: (model?.image)!))
                commentCell1.text = "\((model?.commentCount)!)条评论"
                
            }
            
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
