//
//  Recipe.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/03/26.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class Recipe {
    
    var redipeId:String = ""
    var title:String = ""
    var amount:Int = 0
    var peaple:Int = 0
    var foodList: [FoodWithAmount] = []
    var recipeDescription:String = ""
    
    init(redipeId: String, title: String, amount: Int, peaple: Int, foodList: [FoodWithAmount], recipeDescription: String){
        self.redipeId = redipeId
        self.title = title
        self.amount = amount
        self.peaple = peaple
        self.foodList = foodList
        self.recipeDescription = recipeDescription
    }
    
}
