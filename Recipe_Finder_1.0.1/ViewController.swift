//
//  ViewController.swift
//  Recipe_Finder_1.0.1
//
//  Created by 釣部正義 on 2020/05/01.
//  Copyright © 2020 jasu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var keyword1 : String! = ""
    var keyword2 : String! = ""
    var keyword3 : String! = ""
    var keywordFu : String! = ""
    var keywordDi : String! = ""
    
    
    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var ingredient1: UITextField!
    @IBOutlet weak var ingredient2: UITextField!
    @IBOutlet weak var ingredient3: UITextField!
    
    //lab countrystyle JP EU CH ANY styleoption
    @IBOutlet weak var countryStyle: UILabel!
    @IBOutlet weak var styleOption: UISegmentedControl!
    @IBAction func styleOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            keywordFu = "和風"
        case 1:
            keywordFu = "洋風"
        case 2:
            keywordFu = "中華風"
        case 3:
            keywordFu = ""
        default:
            keywordFu = ""
        }
    }
    //lab dishstyle main soup snack any type
    @IBOutlet weak var dishStyle: UILabel!
    @IBAction func dishOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            keywordDi = "おかず"
        case 1:
            keywordDi = "スープ"
        case 2:
            keywordDi = "おつまみ"
        case 3:
            keywordDi = ""
        default:
            keywordDi = ""
        }
    }
    
    //検索機能
    @IBOutlet weak var searchButton: UIButton!
    @IBAction func searchRecipi(_ sender: UIButton) {
        keyword1 = ingredient1.text
        keyword2 = ingredient2.text
        keyword3 = ingredient3.text
        //日本語に対応するためパーセントエンコーディング化する
        let perKey1 : String! = percentEncording(keyword1)
        let perKey2 : String! = percentEncording(keyword2)
        let perKey3 : String! = percentEncording(keyword3)
        
        let perKeyFu : String! = percentEncording(keywordFu)
        let perKeyDi : String! = percentEncording(keywordDi)
        
        let urlBase : String! = "https://google.co.jp/search?q="
        var url : String!
        url = urlBase + perKey1 + "+" + perKey2 + "+" + perKey3 + "+" + perKeyFu + "+" + perKeyDi
        UIApplication.shared.open(URL(string : url)!, options: [:], completionHandler: nil)
        sender.setTitle("検索！", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredient.text = "使いたい食材はありますか？"
        keywordFormat( ingredient1, str: "1")
        keywordFormat( ingredient2, str: "2")
        keywordFormat( ingredient3, str: "3")
        
        countryStyle.text = "どんな料理にしますか？"
        
        dishStyle.text = "何を作りますか？"
        
        searchButton.setTitle("準備OK! 検索！", for: .normal)
    }
    
    //検索ワード入力フォーマットのメソッド
    func keywordFormat(_ textField: UITextField, str: String!){
        textField.placeholder = "食材" + str
        textField.returnKeyType = UIReturnKeyType.google //検索ボタン
        textField.clearButtonMode = UITextField.ViewMode.always //つねに表示
        //return true
    }
    
    //パーセントエンコーディングの関数
    func percentEncording(_ str: String!) -> String!{
        return str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

    //テキストフィールドでリターンが押されたときに通知され起動するメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()　←↓どっちでもいい
        self.view.endEditing(true)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画面外タッチでテキスト入力終了
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

