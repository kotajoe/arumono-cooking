//
//  RankingViewController.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/04/16.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var rankingTableView: UITableView!

    // 冠画像
    let gold = UIImage(named: "gold")
    let silver = UIImage(named: "silver")
    let bronze = UIImage(named: "bronze")
    let black = UIImage(named: "black")
    
    // サンプル
    var sampleRankingResults: [SampleRanking.RankingResult] = SampleRanking().sampleRankingResults

    override func viewDidLoad() {
        super.viewDidLoad()

        rankingTableView.delegate = self
        rankingTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleRankingResults.count
    }
    
    // セルの内容を追加
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "RankingTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RankingTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchResultTableViewCell.")
        }
        
        cell.recipeTitle.text = sampleRankingResults[indexPath.row].rankingRecipeTitle
        cell.rankingNum.text = sampleRankingResults[indexPath.row].rankingNum.description
        switch sampleRankingResults[indexPath.row].rankingNum{
        case 1:
            cell.crownImage.image = gold
        case 2:
            cell.crownImage.image = silver
        case 3:
            cell.crownImage.image = bronze
        default:
            cell.crownImage.image = black
        }
        return cell
    }

    // セルがタップされた時
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(sampleRankingResults[indexPath.row].rankingRecipeTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeFromRanking"{

            let recipeViewController = segue.destination as!  RecipeViewController
            guard let selectedCell = sender as? RankingTableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = rankingTableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedRecipe = sampleRankingResults[indexPath.row].rankingRecipeId
            recipeViewController.recipeId = selectedRecipe
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
