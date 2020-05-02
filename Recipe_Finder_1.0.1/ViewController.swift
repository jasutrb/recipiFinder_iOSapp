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

    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var ingredient1: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBAction func searchRecipi(_ sender: UIButton) {
        let url : String! = "https://google.co.jp/search?q="
        UIApplication.shared.open(URL(string : url + keyword1)!, options: [:], completionHandler: nil)
        sender.setTitle("検索！", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ingredient.text = "材料は何を使う？"
        
        ingredient1.placeholder = "材料1"
        ingredient1.returnKeyType = UIReturnKeyType.google //検索ボタン
        ingredient1.clearButtonMode = UITextField.ViewMode.always //つねに表示
        
        searchButton.setTitle("準備OK!検索！", for: .normal)
        

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
    //画面外タッチで入力終了
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        keyword1 = ingredient1.text
        self.view.endEditing(true)
    }
}

