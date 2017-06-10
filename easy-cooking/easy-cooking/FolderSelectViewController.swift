//
//  FolderSelectViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/05/27.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

protocol FolderSelectViewControllerDelegate{
    func modalDidFinished(modalText: String)
}

class FolderSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var delegate: FolderSelectViewControllerDelegate! = nil
    private var myTableView: UITableView!
    var userDefault:UserDefaults = UserDefaults()
    var bookmarkFolfers:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookmarkFolfers = userDefault.stringArray(forKey: "boolmarkFolders")!
        
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成(Status barの高さをずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
        
        // Cell名の登録をおこなう.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "FolderNameCell")
        
        // DataSourceを自身に設定する.
        myTableView.dataSource = self
        
        // Delegateを自身に設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    /*
     Cellが選択された際に呼び出される
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたフォルダを返す
        self.delegate.modalDidFinished(modalText: String(describing: bookmarkFolfers[indexPath.row]))
    }
    
    /*
     Cellの総数を返す.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkFolfers.count
    }
    
    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "FolderNameCell", for: indexPath as IndexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(bookmarkFolfers[indexPath.row])"
        
        return cell
    }
    
    
}
