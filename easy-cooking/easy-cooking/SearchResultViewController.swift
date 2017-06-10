//
//  SearchResultViewController.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/04/02.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchEntryView: UIView!
    @IBOutlet weak var searchEntry: UILabel!
    var forSearchEntryLabel: String?
    
    // サンプル
    var sampleSearchResults: [SampleRecipe.SearchResult] = SampleRecipe().sampleSearchResults
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchEntryView.layer.borderColor = UIColor.gray.cgColor
        searchEntryView.layer.borderWidth = 1
        
        searchEntry.text = forSearchEntryLabel
        
        resultTableView.delegate = self
        resultTableView.dataSource = self

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // セルの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleSearchResults.count
    }
    
    // セルのテキストを追加
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SearchResultTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchResultTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchResultTableViewCell.")
        }
        
        cell.recipeTitle.text = sampleSearchResults[indexPath.row].resultTitle
        return cell
    }
    
    // セルがタップされた時
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(sampleSearchResults[indexPath.row].resultTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeFromFoods"{

            let recipeViewController = segue.destination as!  RecipeViewController
            guard let selectedCell = sender as? SearchResultTableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = resultTableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedRecipe = sampleSearchResults[indexPath.row].resultRecipeId
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
