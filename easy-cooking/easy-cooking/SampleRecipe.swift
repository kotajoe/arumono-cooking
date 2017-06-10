//
//  SampleRecipe.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/04/02.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class SampleRecipe {
    
    struct SearchResult {
        var resultTitle: String
        var resultRecipeId: String
        
        init(recipe: Recipe){
            resultTitle = recipe.title
            resultRecipeId = recipe.redipeId
        }
    }
    
    var sampleRecipes = [Recipe]()
    var sampleSearchResults = [SearchResult]()
    
    
    
    init(){
        
        var foodWithAmounts = [FoodWithAmount]()
        var targetRecipe: Recipe
        foodWithAmounts.append(FoodWithAmount(foodName: "牛バラ", amount: "250g"))
        foodWithAmounts.append(FoodWithAmount(foodName: "キャベツ", amount: "3枚"))
        foodWithAmounts.append(FoodWithAmount(foodName: "塩", amount: "適量"))
        foodWithAmounts.append(FoodWithAmount(foodName: "胡椒", amount: "適量"))
        foodWithAmounts.append(FoodWithAmount(foodName: "醤油", amount: "大さじ1"))
        foodWithAmounts.append(FoodWithAmount(foodName: "砂糖", amount: "小さじ1"))
        foodWithAmounts.append(FoodWithAmount(foodName: "オイスター", amount: "大さじ1"))
        foodWithAmounts.append(FoodWithAmount(foodName: "キャベツ", amount: "3枚"))
        
        targetRecipe = Recipe(redipeId: "RC0110_002", title: "牛肉とキャベツのオイスターソース炒め", peaple: 1, foodList: foodWithAmounts, recipeDescription:"①牛肉は、塩と胡椒で下味する。キャベツは、ざく切りにする。\n②フライパンに油を引いて、牛肉を入れて炒める。色が変わったらキャベツも入れて炒める。\n③砂糖、醤油、オイスターソースを混ぜる。")
        
        sampleRecipes.append(targetRecipe)
        sampleSearchResults.append(SearchResult(recipe: targetRecipe))
        
        foodWithAmounts.removeAll()
        
        
        foodWithAmounts.append(FoodWithAmount(foodName: "牛バラ", amount: "200g"))
        foodWithAmounts.append(FoodWithAmount(foodName: "トマト", amount: "1個"))
        foodWithAmounts.append(FoodWithAmount(foodName: "塩", amount: "適量"))
        foodWithAmounts.append(FoodWithAmount(foodName: "醤油", amount: "小さじ2"))
        foodWithAmounts.append(FoodWithAmount(foodName: "砂糖", amount: "小さじ2"))
        foodWithAmounts.append(FoodWithAmount(foodName: "酒", amount: "大さじ1と1/2"))
        foodWithAmounts.append(FoodWithAmount(foodName: "バター", amount: "5g"))
        foodWithAmounts.append(FoodWithAmount(foodName: "黒胡椒", amount: "適量"))
        foodWithAmounts.append(FoodWithAmount(foodName: "おろしにんにく", amount: "小さじ1/2"))
        
        targetRecipe = Recipe(redipeId: "RC0112_001", title: "トマトと牛肉のガーリック炒め", peaple: 2, foodList: foodWithAmounts, recipeDescription: "①トマトは8等分にする。牛肉は食べやすい大きさに切る。\n②バター、おろしにんにく、酒、砂糖、醤油を合わせる。\n③フライパンにサラダ油を中火で熱し、牛肉を炒める。色が変わったら塩、こしょうをふり、トマトを加えてサッと炒める。\n④②を加えて全体的にからめる。")

        sampleRecipes.append(targetRecipe)
        sampleSearchResults.append(SearchResult(recipe: targetRecipe))
        
        foodWithAmounts.removeAll()
        
        foodWithAmounts.append(FoodWithAmount(foodName: "牛バラ", amount: "150g"))
        foodWithAmounts.append(FoodWithAmount(foodName: "トマト", amount: "1個"))
        foodWithAmounts.append(FoodWithAmount(foodName: "ネギ", amount: "1本"))
        foodWithAmounts.append(FoodWithAmount(foodName: "卵", amount: "4個"))
        foodWithAmounts.append(FoodWithAmount(foodName: "塩", amount: "少々"))
        foodWithAmounts.append(FoodWithAmount(foodName: "醤油", amount: "大さじ1と1/2"))
        foodWithAmounts.append(FoodWithAmount(foodName: "砂糖", amount: "大さじ1と1/2"))
        foodWithAmounts.append(FoodWithAmount(foodName: "酒", amount: "大さじ1と1/2"))
        
        
        targetRecipe = Recipe(redipeId: "RC0110121550_001", title: "牛肉とトマトと卵の炒めもの", peaple: 4, foodList: foodWithAmounts, recipeDescription: "①牛肉は一口大に切る。\n②卵はかき混ぜて、塩を加えて混ぜる。\n③トマトは縦8等分のくし形切りにしてから、横に半分に切る。長ねぎは5mm幅の斜め切りにする。\n④鍋に油大さじ1を熱し、卵を流し入れて強めの中火で大きくかき混ぜ、半熟に固まったらいったんとり出す。\n⑤油大さじ1を熱し、①の牛肉を入れて強めの中火でほぐしながら炒め、色が変わったら酒、醤油、砂糖、を加えて、汁気が少なくなるまで炒める。\n⑥長ねぎを加えてサッと炒める\n⑦トマトを加えて塩をふり、強火で1分ほど炒める。\n⑧汁気が少なくなったら卵を戻し入れ、全体にざっと炒め合わせる。")
        
        sampleRecipes.append(targetRecipe)
        sampleSearchResults.append(SearchResult(recipe: targetRecipe))
        
    }
    
}
