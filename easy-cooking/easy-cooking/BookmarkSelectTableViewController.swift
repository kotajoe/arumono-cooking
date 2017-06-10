//
//  BookmarkSelectTableViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/06/04.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class BookmarkSelectTableViewController: UITableViewController {
    
    @IBOutlet var bookmarkTableView: UITableView!
    var userDefault:UserDefaults = UserDefaults()
    var selectedFolder:String!
    var bookmarks:[RecipeidWithTitle]?
    // サンプル
    var sampleSearchResults: [SampleRecipe.SearchResult] = SampleRecipe().sampleSearchResults
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(bookmarks == nil){
            return 0
        }
        
        return (bookmarks?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BookmarkSelectTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BookmarkSelectTableViewCell else {
            fatalError("The dequeued cell is not an instance of BookmarkSelectTableViewCell.")
        }
        
        // Cellに値を設定する.
        cell.bookmarkTitleLabel.text = bookmarks?[indexPath.row].title
        
        return cell
    }
    
    // viewを表示する際
    override func viewWillAppear(_ animated: Bool) {
        // 選択状態を削除
        if bookmarkTableView.indexPathForSelectedRow != nil{
            self.bookmarkTableView.deselectRow(at: bookmarkTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    // セルがタップされた時
    override func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(bookmarks?[indexPath.row].title ?? "noRecipe")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeFromBookmark"{
            
            let recipeViewController = segue.destination as!  RecipeViewController
            guard let selectedCell = sender as? BookmarkSelectTableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = bookmarkTableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedRecipe = bookmarks?[indexPath.row].redipeId
            recipeViewController.recipeId = selectedRecipe!
            
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
