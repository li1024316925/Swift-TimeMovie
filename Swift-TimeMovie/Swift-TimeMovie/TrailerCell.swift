//
//  TrailerCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/25.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class TrailerCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    //赋值完成后调用
    var model:TrailerModel?{
        didSet{
            
            title.text = model?.movieName
            title2.text = model?.summary
            movieImage.sd_setImage(with: URL(string: (model?.coverImg)!))
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
