//
//  FoodSelectViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/03/19.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit
import os.log

class FoodSelectViewController: UITableViewController {
    
    var foodList: [Food] = [Food(foodId: "00", foodName: "牛肉"),Food(foodId: "01", foodName: "牛バラ"),Food(foodId: "02", foodName: "豚肉"),Food(foodId: "03", foodName: "豚バラ"),Food(foodId: "04", foodName: "鶏肉"),Food(foodId: "05", foodName: "ひき肉"),Food(foodId: "10", foodName: "キャベツ"),Food(foodId: "11", foodName: "大根"),Food(foodId: "12", foodName: "トマト"),Food(foodId: "13", foodName: "レタス"),Food(foodId: "14", foodName: "白菜"),Food(foodId: "15", foodName: "ネギ"),Food(foodId: "16", foodName: "タマネギ"),Food(foodId: "17", foodName: "ピーマン"),Food(foodId: "18", foodName: "パプリカ"),Food(foodId: "19", foodName: "にんじん"),Food(foodId: "20", foodName: "なす"),Food(foodId: "21", foodName: "じゃがいも"),Food(foodId: "22", foodName: "かぼちゃ"),Food(foodId: "23", foodName: "ほうれん草"),Food(foodId: "24", foodName: "もやし"),Food(foodId: "25", foodName: "ごぼう"),Food(foodId: "26", foodName: "ブロッコリー"),Food(foodId: "40", foodName: "しいたけ"),Food(foodId: "41", foodName: "えのき"),Food(foodId: "42", foodName: "しめじ"),Food(foodId: "43", foodName: "舞茸"),Food(foodId: "44", foodName: "マッシュルーム"),Food(foodId: "50", foodName: "卵"),Food(foodId: "51", foodName: "チーズ"),Food(foodId: "60", foodName: "いか"),Food(foodId: "61", foodName: "たこ"),Food(foodId: "62", foodName: "えび"),Food(foodId: "63", foodName: "ぶり"),Food(foodId: "64", foodName: "あじ"),Food(foodId: "65", foodName: "さんま"),Food(foodId: "66", foodName: "鮭"),Food(foodId: "80", foodName: "納豆"),Food(foodId: "81", foodName: "豆腐")]
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var selectedCount: Int = 0
    var selectedFoods: [Food] = []
    var canceledFlg: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FoodTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FoodTableViewCell else {
            fatalError("The dequeued cell is not an instance of FoodTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let food = foodList[indexPath.row]
        
        cell.foodNameLabel.text = food.foodName
        
        cell.selectionStyle = UITableViewCellSelectionStyle.blue
        
        if selectedCount == 3 {
            cell.isUserInteractionEnabled = false
            cell.foodNameLabel.textColor = UIColor.gray
            for threeFoods in selectedFoods{
                if threeFoods.foodName == cell.foodNameLabel.text{
                    cell.isUserInteractionEnabled = true
                    cell.foodNameLabel.textColor = UIColor.black
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.middle)
                    break;
                }
            }
        }

        if selectedCount == 2 {
            cell.isUserInteractionEnabled = true
            cell.foodNameLabel.textColor = UIColor.black
            for twoFoods in selectedFoods{
                if twoFoods.foodName == cell.foodNameLabel.text{
                    tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.middle)
                    break;
                }
            }
        }
        
        return cell
    }
    
    // セルが選択された時に呼び出される
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        selectedCount = selectedCount + 1
        selectedFoods.append(foodList[indexPath.row])
        
        
        if selectedCount == 3 {
            // テーブルの再描画。
            tableView.reloadData()
        }
        
        cell?.accessoryType = .checkmark
        
    }
    
    // セルの選択が外れた時に呼び出される
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
        selectedCount = selectedCount - 1
        var selectedFoodIndex: Int = 0
        for food in selectedFoods{
            if food.foodName == foodList[indexPath.row].foodName{
                selectedFoods.remove(at: selectedFoodIndex)
                break
            }
            selectedFoodIndex = selectedFoodIndex + 1
            
        }
        
        if selectedCount == 2 {
            // テーブルの再描画。
            
            tableView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            canceledFlg = true
            return
        }
        
    }
    
    
}
