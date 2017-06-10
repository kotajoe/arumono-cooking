//
//  FoodTableViewCell.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/03/20.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
