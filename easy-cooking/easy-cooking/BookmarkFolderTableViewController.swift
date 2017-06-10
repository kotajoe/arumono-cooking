//
//  BookmarkFolderTableViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/06/03.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class BookmarkFolderTableViewController: UITableViewController {
    @IBOutlet var bookmarkView: UITableView!
    
    var userDefault:UserDefaults = UserDefaults()
    var bookmarkFolders:[String] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tempBookmarkFolfers:[String]? = userDefault.stringArray(forKey: "boolmarkFolders")
        if (tempBookmarkFolfers == nil){
            userDefault.set(["お気に入り"], forKey: "boolmarkFolders")
            bookmarkFolders = ["お気に入り"]
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        
        print(bookmarkFolders)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookmarkFolders.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BookmarkFolderTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BookmarkFolderTableViewCell else {
            fatalError("The dequeued cell is not an instance of BookmarkFolderTableViewCell.")
        }
        
        print(bookmarkFolders[indexPath.row])
        
        // Cellに値を設定する.
        cell.folderNameLabel.text = bookmarkFolders[indexPath.row]
        
        return cell
    }
    
    // viewを表示する際
    override func viewWillAppear(_ animated: Bool) {
        // 選択状態を削除
        if bookmarkView.indexPathForSelectedRow != nil{
            self.bookmarkView.deselectRow(at: bookmarkView.indexPathForSelectedRow!, animated: true)
        }
    }

    
    
    // セルがタップされた時
    override func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(bookmarkFolders[indexPath.row])
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToBookmarks"{
            
            let bookmarkSelectTableViewController = segue.destination as!  BookmarkSelectTableViewController
            guard let selectedCell = sender as? BookmarkFolderTableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = bookmarkView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedFolder = bookmarkFolders[indexPath.row]
            bookmarkSelectTableViewController.selectedFolder = selectedFolder
            
            let bookmarksArray:[String]? = userDefault.stringArray(forKey: "bookmark_" + selectedFolder)
            if bookmarksArray != nil{
            let bookmarkManager = BookmarksManager()
            bookmarkSelectTableViewController.bookmarks = bookmarkManager.getBookmarks(bookmarksArray: bookmarksArray!)
            }
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
