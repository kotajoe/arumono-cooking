//
//  SearchByFoodViewController.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/03/08.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class SearchByFoodViewController: UIViewController {
    
    @IBOutlet weak var foodSelectUIView: UIView!
    @IBOutlet weak var includeOtherfoodView: UIView!
    @IBOutlet weak var firstFoodLabel: UILabel!
    @IBOutlet weak var seconfFoodLabel: UILabel!
    @IBOutlet weak var thirdFoodLabel: UILabel!
    @IBOutlet weak var firstSelectedFoodLabel: UILabel!
    @IBOutlet weak var secondSelectedFoodLabel: UILabel!
    @IBOutlet weak var thirdSelectedFoodLabel: UILabel!
    
    // MARK:Properties
    let foodLabelCornerRadius = 5
    var selectedFoods: [Food] = []
    var selectedFoodsCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodSelectUIView.layer.borderColor = UIColor.gray.cgColor
        foodSelectUIView.layer.borderWidth = 0.5
        includeOtherfoodView.layer.borderColor = UIColor.gray.cgColor
        includeOtherfoodView.layer.borderWidth = 0.5
        
        setFoodLabel(foodLabel: firstFoodLabel)
        setFoodLabel(foodLabel: seconfFoodLabel)
        setFoodLabel(foodLabel: thirdFoodLabel)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchByFood"{
            // 検索項目の文字列に食材を設定
            let searchResultViewController = segue.destination as!  SearchResultViewController
            
            searchResultViewController.forSearchEntryLabel = ""
            if selectedFoodsCount > 0{
                searchResultViewController.forSearchEntryLabel = selectedFoods[0].foodName
            }
            
            if selectedFoodsCount > 1{
                searchResultViewController.forSearchEntryLabel = searchResultViewController.forSearchEntryLabel! + "/" + selectedFoods[1].foodName
            }
            
            if selectedFoodsCount > 2{
                searchResultViewController.forSearchEntryLabel = searchResultViewController.forSearchEntryLabel! + "/" +  selectedFoods[2].foodName
            }
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
    
    //MARK: Actions
    @IBAction func unwindToSerchView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FoodSelectViewController{
            
            selectedFoods = sourceViewController.selectedFoods
            selectedFoodsCount = sourceViewController.selectedCount
            let cancelFlg: Bool = sourceViewController.canceledFlg
            if !cancelFlg{
                
                if selectedFoodsCount > 0{
                    firstSelectedFoodLabel.text = selectedFoods[0].foodName
                } else {
                    firstSelectedFoodLabel.text = ""
                }
                
                if selectedFoodsCount > 1{
                    secondSelectedFoodLabel.text = selectedFoods[1].foodName
                } else {
                    secondSelectedFoodLabel.text = ""
                }
                
                if selectedFoodsCount > 2{
                    thirdSelectedFoodLabel.text = selectedFoods[2].foodName
                } else {
                    thirdSelectedFoodLabel.text = ""
                }
            }
            
        }
    }
    
    
    //MARK: private methods
    private func setFoodLabel(foodLabel: UILabel){
        foodLabel.layer.cornerRadius = 5
        foodLabel.clipsToBounds = true
    }
    
}
