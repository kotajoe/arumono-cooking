//
//  RecipeViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/04/02.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {


    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var recipeTitle: UILabel!
    var recipeId: String = ""
    @IBOutlet var titleView: UIView!
    var currentRecipe: Recipe!
    
    // サンプルデータ取得
    var sampleRecipes: [Recipe] = SampleRecipe().sampleRecipes
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for recipe in sampleRecipes{
            if recipe.redipeId == recipeId{
                currentRecipe = recipe
                break
            }
        }
        
        // 仮でお気に入りボタンを配置。
        let bookMarkButton = UIButton()
        // ボタンのサイズ.
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        // ボタンのX,Y座標.
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = 100//self.view.frame.height/2 - bHeight/2
        
        // ボタンの設置座標とサイズを設定する.
        bookMarkButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        bookMarkButton.backgroundColor = UIColor.red
        
        // タイトルを設定する(通常時).
        bookMarkButton.setTitle("ブックマークに追加", for: .normal)
        bookMarkButton.setTitleColor(UIColor.white, for: .normal)
        // イベントを追加する
        bookMarkButton.addTarget(self, action: #selector(RecipeViewController.onClickBookmarkButton(sender:)), for: .touchUpInside)
        
        // ボタンをViewに追加.
        self.view.addSubview(bookMarkButton)
        
        
        let materialLabel = UILabel()
        materialLabel.textAlignment = NSTextAlignment.center
        var numberOfLines: Int = 2
        materialLabel.text = "材料(" + currentRecipe.peaple.description + "人前)\n"
        for foodWithAmount in currentRecipe.foodList{
            materialLabel.text = materialLabel.text! + foodWithAmount.foodName + " : " + foodWithAmount.amount + "\n"
            numberOfLines = numberOfLines + 1
        }
        materialLabel.numberOfLines = numberOfLines
        
        materialLabel.frame.origin.x = 0
        materialLabel.frame.origin.y = bookMarkButton.frame.origin.y + bookMarkButton.frame.size.height

        // コンテンツに合わせてサイズを自動調整してくれる.
        materialLabel.sizeToFit()
        // View に ScrollView を追加.
        scrollView.addSubview(materialLabel)
        
        //labelのframe(位置とサイズ)を取っとく
        let labelframe: CGRect = materialLabel.frame
        
        //レシピ内容の設定
        let detailLabel = UILabel()
        detailLabel.text = currentRecipe.recipeDescription
        detailLabel.numberOfLines = 0
        detailLabel.frame.origin.x = 0
        detailLabel.frame.origin.y = labelframe.origin.y + labelframe.size.height
        detailLabel.sizeToFit()
        detailLabel.lineBreakMode = .byCharWrapping
        scrollView.addSubview(detailLabel)
        
        
        titleView.layer.borderColor = UIColor.gray.cgColor
        titleView.layer.borderWidth = 1
        
        
        
        recipeTitle.text = currentRecipe.title
        
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
     ボタンのイベント.
     */
    internal func onClickBookmarkButton(sender: UIButton) {
        // ViewControllerのインスタンス生成.
        let second = BookmarkViewController()
        
        // navigationControllerのrootViewControllerにsecondViewControllerをセット.
        let nav = UINavigationController(rootViewController: second)
        
        second.currentRecipe = currentRecipe
        
        // 画面遷移.
        self.present(nav, animated: true, completion: nil)
    }

}
