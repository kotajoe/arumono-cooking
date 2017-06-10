//
//  BookmarkViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/05/21.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController, FolderSelectViewControllerDelegate {
    
    let modalView = FolderSelectViewController()
    var currentRecipe: Recipe!
    var selectedFolder:String = "お気に入り"
    var userDefault:UserDefaults = UserDefaults()
    var bookmarks:[String] = []


    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        
        // 登録するレシピ名を表示
        // ラベルのサイズを定義
        let titleWidth: CGFloat = 350
        let titleHeight: CGFloat = 50
        
        // 配置する座標を定義(画面の中心)
        let titlePosX: CGFloat = self.view.bounds.width/2 - titleWidth/2
        let titlePosY: CGFloat = 100
        
        // Labelを作成.
        let titleLabel: UILabel = UILabel(frame: CGRect(x: titlePosX, y: titlePosY, width: titleWidth, height: titleHeight))
        titleLabel.text = currentRecipe.title
        titleLabel.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(titleLabel)
        
        // 選択されたフォルダを表示
        // ラベルのサイズを定義
        let folderWidth: CGFloat = 350
        let folderHeight: CGFloat = 50
        
        // 配置する座標を定義(画面の中心)
        let folderPosX: CGFloat = self.view.bounds.width/2 - folderWidth/2
        let folderPosY: CGFloat = titlePosY + 30
        
        // Labelを作成.
        let folderLabel: UILabel = UILabel(frame: CGRect(x: folderPosX, y: folderPosY, width: folderWidth, height: folderHeight))
        folderLabel.text = "登録フォルダ：" + selectedFolder
        folderLabel.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(folderLabel)
        
        // フォルダ選択Buttonを生成.
        let selectFolderButton = UIButton()
        selectFolderButton.frame = CGRect(x: 0, y: 0, width: 170, height: 25)
        selectFolderButton.backgroundColor = UIColor.gray
        selectFolderButton.layer.masksToBounds = true
        selectFolderButton.setTitle("フォルダ選択", for: UIControlState.normal)
        selectFolderButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        selectFolderButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        selectFolderButton.layer.cornerRadius = 5.0
        selectFolderButton.layer.position = CGPoint(x: self.view.frame.width/2, y:folderPosY + 55)
        selectFolderButton.tag = 1
        selectFolderButton.addTarget(self, action: #selector(BookmarkViewController.onClickSelectFolderButton(sender:)), for: .touchUpInside)
        
        // viewにButtonを追加.
        self.view.addSubview(selectFolderButton)
        
        // 登録Buttonを生成.
        let registerButton = UIButton()
        registerButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        registerButton.backgroundColor = UIColor.red
        registerButton.layer.masksToBounds = true
        registerButton.setTitle("登録", for: UIControlState.normal)
        registerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        registerButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        registerButton.layer.cornerRadius = 20.0
        registerButton.layer.position = CGPoint(x: self.view.frame.width/2, y:250)
        registerButton.tag = 1
        registerButton.addTarget(self, action: #selector(BookmarkViewController.onClickRegisterButton(sender:)), for: .touchUpInside)
        
        // viewにButtonを追加.
        self.view.addSubview(registerButton)
        
        // もどるButtonを生成.
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        backButton.backgroundColor = UIColor.red
        backButton.layer.masksToBounds = true
        backButton.setTitle("もどる", for: UIControlState.normal)
        backButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        backButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: self.view.frame.width/2, y:300)
        backButton.tag = 1
        backButton.addTarget(self, action: #selector(BookmarkViewController.onClickBackButton(sender:)), for: .touchUpInside)
        
        // viewにButtonを追加.
        self.view.addSubview(backButton)
        
        self.modalView.delegate = self
        
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
     戻るButtonを押した時に呼ばれるメソッド.
     */
    func onClickBackButton(sender : UIButton){
        
        // viewを閉じる.
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    /*
     登録Buttonを押した時に呼ばれるメソッド.
     */
    func onClickRegisterButton(sender : UIButton){
        
        let bookmarkArray:[String]? = userDefault.stringArray(forKey: "bookmark_" + selectedFolder)
        if bookmarkArray != nil {
            bookmarks = bookmarkArray!
        }
        bookmarks.append(currentRecipe.redipeId + "\t" + currentRecipe.title)
        userDefault.set(bookmarks, forKey: "bookmark_" + selectedFolder)
        
        let myAlert: UIAlertController = UIAlertController(title: "お気に入り追加", message: "お気に入り追加しました。", preferredStyle: .alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
            // viewを閉じる.
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        present(myAlert, animated: true, completion: nil)
        
        
    }

    
    //フォルダ選択ボタンを押下時に呼び出される
    func onClickSelectFolderButton(sender : UIButton){
        
        // ViewControllerのインスタンス生成.
        //let second = FolderSelectViewController()
        
        // navigationControllerのrootViewControllerにsecondViewControllerをセット.
        //let nav = UINavigationController(rootViewController: second)
        
        // 画面遷移.
        self.present(self.modalView, animated: true, completion: nil)
    }
    
    
    func modalDidFinished(modalText: String){
        self.selectedFolder = modalText
        self.modalView.dismiss(animated: true, completion: nil)
        
        //Viewの再読み込み
        loadView()
        viewDidLoad()
    }

    
}
