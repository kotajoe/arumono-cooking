//
//  SearchByAmountViewController.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/03/14.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import UIKit

class SearchByAmountViewController: UIViewController, AlertPickerViewDelegate, UIPickerViewDelegate {

    //MARK:Properties
    @IBOutlet weak var amountSelectView: UIView!
    @IBOutlet weak var highAmountLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var lowAmountLabel: UILabel!
    @IBOutlet weak var lowAmount: UILabel!
    @IBOutlet weak var highAmount: UILabel!
    var pickerView: AlertPickerView!
    let array = ["", "1円〜50円", "51円〜100円", "101円〜150円", "151円〜200円", "201円〜250円", "251円〜300円", "301円〜350円", "351円〜400円", "401円〜450円", "451円〜500円", "501円〜550円"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView = AlertPickerView()
        
        self.pickerView.items = array
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.view.addSubview(pickerView)
        
        selectButton.addTarget(self, action: #selector(SearchByAmountViewController.showPicker), for: UIControlEvents.touchDown)
        
        amountSelectView.layer.borderColor = UIColor.gray.cgColor
        amountSelectView.layer.borderWidth = 0.5
        setAmountLabel(amountLabel: highAmountLabel)
        setAmountLabel(amountLabel: lowAmountLabel)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
       textField.resignFirstResponder()
        return true
    }

    
    func showPicker() {
        self.pickerView.showPicker()
    }
    
    // for delegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerView.items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerView.items[row]
    }
    
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var parseWord: String = self.pickerView.items[row]
        parseWord = parseWord.replacingOccurrences(of:"円", with: "")
        let parsedWords = parseWord.components(separatedBy: "〜")
        lowAmount.text = parsedWords[0]
        highAmount.text = parsedWords[1]
    }
    
    func pickerViewDidHide(pickerView: UIPickerView) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchByAmount"{
            // 検索項目の文字列に値段を設定
            let searchResultViewController = segue.destination as!  SearchResultViewController
            searchResultViewController.forSearchEntryLabel = "下限金額：" + lowAmount.text! + "円、上限金額" + highAmount.text! + "円"
        }

    }

    private func setAmountLabel(amountLabel: UILabel){
        amountLabel.layer.cornerRadius = 5
        amountLabel.clipsToBounds = true
    }
}
