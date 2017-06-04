//
//  SampleRanking.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/04/16.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class SampleRanking {
    
    struct RankingResult {
        var rankingRecipeId: String
        var rankingRecipeTitle: String
        var rankingNum: Int
        
        init(recipe: Recipe, num: Int){
            rankingRecipeTitle = recipe.title
            rankingNum = num
            rankingRecipeId = recipe.redipeId
        }
    }
    
    // サンプルレシピ取得
    var sampleRecipes: [Recipe] = SampleRecipe().sampleRecipes
    var sampleRankingResults = [RankingResult]()
    
    
    init(){
        
        var rank: Int = 0
        
        for sampleRecipe in sampleRecipes{
            sampleRankingResults.append(RankingResult(recipe: sampleRecipe, num: rank + 1))
            rank = rank + 1
        }
    }
    
}
