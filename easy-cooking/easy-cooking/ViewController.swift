//
//  ViewController.swift
//  easy-cooking
//
//  Created by Kota Watanabe on 2017/03/05.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var mainTabBar: UITabBar!
    @IBOutlet weak var foodSelectionView: UIView!
    @IBOutlet weak var priceSelectionView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        foodSelectionView.isHidden = false
        priceSelectionView.isHidden = true
        mainTabBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        switch item.tag {
        case 1:
            foodSelectionView.isHidden = false
            priceSelectionView.isHidden = true
            
        case 2:
            foodSelectionView.isHidden = true
            priceSelectionView.isHidden = false
        default:
            return
        }
    }


}

