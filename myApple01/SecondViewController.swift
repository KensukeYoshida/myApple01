//
//  SecondViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/06/27.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController{
    

    @IBOutlet weak var txtTitle: UITextField!
    
     var words = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comment.text = "自分の思いついた単語を追加して\nオリジナルの単語帳を作成しましょう"
        read()
        
        makeKeybord()
    }
    
    @IBOutlet weak var comment: UILabel!
    
    
    @IBAction func tapReturn(_ sender: UITextField) {
    }
    
    
    
    //すでに存在するデータの読込処理
    func read(){
        //AppDelegateを使う用意しておく
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // エンティティを操作するためのオブジェクトを作成
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //どのエンティティからdataを取得してくるか設定
        let query : NSFetchRequest<Words> = Words.fetchRequest()
        
        
        do{
            //データを一括取得
            let fetchResults = try viewContext.fetch(query)
            for result:AnyObject in fetchResults{
                let title: String = result.value(forKey:"title") as! String

                words.append(title)
            }
            
       }catch{
       }
    }
    
    func makeKeybord(){
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(SecondViewController.commitButtonTapped))
        
        kbToolBar.items = [spacer, commitButton]
        txtTitle.inputAccessoryView = kbToolBar
    }
    func commitButtonTapped (){
        self.view.endEditing(true)
    }


    

    
    //OKボタン押された時、CoreDate追加
   
    @IBAction func tapSave(_ sender: UIButton) {
        
        var checkFlag = false
        
       //Words:存在チェック
        for word:String in words{
            if txtTitle.text == word {
                checkFlag = true
            }
        
        }
            
            
        if checkFlag == false{
    
            //AppDelegateのインスタンスを用意しておく (as!はダウンキャスト ＜値＞as!＜型＞)
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
            //エンティティを操作するためのオブジェクトを作成
            let viewContext = appDelegate.persistentContainer.viewContext
        
            //Wordsエンティティオブジェクトを作成
            let Words = NSEntityDescription.entity(forEntityName: "Words", in: viewContext)
        
            //Wordsエンティティにレコード(行)を挿入するためのオブジェクトを作成
            let newRecord = NSManagedObject(entity: Words!, insertInto: viewContext)
            //③上記まで
        
        
            //追加したいdata(txtTitleに入力された文字)のセット
            newRecord.setValue(txtTitle.text, forKey: "title")//値の代入
            newRecord.setValue(Date(),forKey: "saveDate")
            //Date():現在日時がセットできる
        
            //レコード（行）の即時保存
            do{
                try viewContext.save()
                 words.append(txtTitle.text!)
            }catch{
            }
        
        }
        //部品のアラートを作る
        let alertController = UIAlertController(title: "単語追加完了", message: "", preferredStyle: .alert)
        
        
        //アラートにOKボタンを追加
        //handler:OKボタンが押された時に行いたい処理を指定する場所
        alertController.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
        
        
        //アラートを表示する
        present(alertController,animated: true,completion: nil)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

