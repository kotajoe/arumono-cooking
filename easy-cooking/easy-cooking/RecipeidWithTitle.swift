//
//  RecipeidWithTitle.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/05/28.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class RecipeidWithTitle {
    
    var redipeId:String = ""
    var title:String = ""
    
    init(recipeidWithTitle: String){
        let split = recipeidWithTitle.components(separatedBy: "\t")
        self.redipeId = split[0]
        self.title = split[1]
    }
    
}
