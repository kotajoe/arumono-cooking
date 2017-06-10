//
//  SearchResultTableViewCell.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/04/02.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

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
