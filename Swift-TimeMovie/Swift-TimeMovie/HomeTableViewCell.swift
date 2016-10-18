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
    
    //赋值完成后调用
    var homeModel:HomeModel?{
        didSet{
            
            titleLable.text = homeModel?.titleCn
            imgView.sd_setImage(with: URL(string: (homeModel?.img)!))
            
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
