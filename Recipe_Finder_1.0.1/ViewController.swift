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
    
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var ingredient1: UITextField!
    @IBOutlet weak var ingredient2: UITextField!
    @IBOutlet weak var ingredient3: UITextField!
    //検索機能
    @IBOutlet weak var searchButton: UIButton!
    @IBAction func searchRecipi(_ sender: UIButton) {
        keyword1 = ingredient1.text
        keyword2 = ingredient2.text
        keyword3 = ingredient3.text
        //日本語に対応するためにパーセントエンコーディングにかける
        let perKey1 : String! = percentEncording(keyword1)
        let perKey2 : String! = percentEncording(keyword2)
        let perKey3 : String! = percentEncording(keyword3)
        
        let urlBase : String! = "https://google.co.jp/search?q="
        var url : String!
        url = urlBase + perKey1 + "+" + perKey2 + "+" + perKey3
        UIApplication.shared.open(URL(string : url)!, options: [:], completionHandler: nil)
        sender.setTitle("検索！", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredient.text = "材料は何を使う？"
        keywordFormat( ingredient1, str: "1")
        keywordFormat( ingredient2, str: "2")
        keywordFormat( ingredient3, str: "3")
        searchButton.setTitle("準備OK! 検索！", for: .normal)
    }
    
    //検索ワード入力フォーマットのメソッド
    func keywordFormat(_ textField: UITextField, str: String!){
        textField.placeholder = "材料" + str
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

