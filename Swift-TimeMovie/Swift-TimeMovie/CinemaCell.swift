//
//  CinemaCell.swift
//  SwiftTimeMovie
//
//  Created by DahaiZhang on 16/10/24.
//  Copyright © 2016年 LLQ. All rights reserved.
//

import UIKit

class CinemaCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    //赋值完成后调用
    var model:CinemaModel?{
        didSet{
            
            title.text = model?.cinemaName
            address.text = model?.address
            length.text = String(format: "距离%.2f公里", arguments: [(model?.length)!])
            price.text = String(format: "￥%.1f", arguments: [(model?.minPrice?.floatValue)!/100.0])
            
            var i = 0
            if model?.feature?["has3D"] == 0 {
                image1.isHidden = true
                //每有一个图片隐藏，就 +1
                i+=1
            }
            //平移图片
            image2.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasIMAX"] == 0 {
                image2.isHidden = true
                i+=1
            }
            image3.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasVIP"] == 0 {
                image3.isHidden = true
                i+=1
            }
            image4.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasPark"] == 0 {
                image4.isHidden = true
                i+=1
            }
            image5.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasServiceTicket"] == 0 {
                image5.isHidden = true
                i+=1
            }
            image6.transform = CGAffineTransform(translationX: CGFloat(-i)*36, y: 0)
            if model?.feature?["hasWifi"] == 0 {
                image6.isHidden = true
                i+=1
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
