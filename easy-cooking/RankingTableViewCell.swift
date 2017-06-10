//
//  RankingTableViewCell.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/04/16.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var crownImage: UIImageView!
    @IBOutlet weak var rankingNum: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
