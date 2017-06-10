//
//  Recipe.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/03/26.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class Recipe {
    
    var redipeId:String = ""
    var title:String = ""
    var peaple:Int = 0
    var foodList: [FoodWithAmount] = []
    var recipeDescription:String = ""
    
    init(redipeId: String, title: String, peaple: Int, foodList: [FoodWithAmount], recipeDescription: String){
        self.redipeId = redipeId
        self.title = title
        self.peaple = peaple
        self.foodList = foodList
        self.recipeDescription = recipeDescription
    }
    
}
