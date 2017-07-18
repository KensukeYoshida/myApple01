//
//  DetailViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/06.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var myLabel3: UILabel!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    //メンバ変数
    var words = ["myLabel1.text = appDelegate.selectedWord1", "myLabel2.text = appDelegate.selectedWord2","myLabel3.text = appDelegate.selectedWord3"]
    
    var title1 = [""]
    var title2 = [""]
    var title3 = [""]
    
    var memo = [""]
    
    
    //ただの数字　sIndexに代入 タップされた行が代入される
    var sIndex = -1
    
    let df = DateFormatter()
    
    let now = Date()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        myLabel1.text = appDelegate.selectedWord1
        myLabel2.text = appDelegate.selectedWord2
        myLabel3.text = appDelegate.selectedWord3
        var amountText = [appDelegate.selectedWord1,appDelegate.selectedWord2,appDelegate.selectedWord3]
        
        appDelegate.amount.adding(amountText)
        

        // Do any additional setup after loading the view.
        
        //エンティティを操作するためのオブジェクトを作成
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //どのエンティティからdataを取得してくるか設定
        let query:NSFetchRequest<Ideas> = Ideas.fetchRequest()
        
        do{
            //データを一括取得
            let fetchResults = try viewContext.fetch(query)
            
            //nはcoredataの行数　sIndexはタップされた行数
            var n = 1
            
            //ループで一行ずつ表示 for 〇〇として in 〇〇を　扱う
            for result:AnyObject in fetchResults{
                let content: String? = result.value(forKey:"memo") as? String
                let title1: String? = result.value(forKey:"title1") as? String
                let title2: String? = result.value(forKey:"title2") as? String
                let title3: String? = result.value(forKey:"title3") as? String
                

                

                
            //nはCoreDateの行数
                if n == sIndex {
                myTextView.text = content
                myLabel1.text = title1
                myLabel2.text = title2
                myLabel3.text = title3
                }
                //Index.rowと同じ　n+=1は周目
                n += 1
                
            }
            

            
        }catch{
        
        }
        
        
    }
    
    
    

    @IBAction func tapSave(_ sender: UIButton) {
        //AppDelegateのインスタンスを用意しておく (as!はダウンキャスト ＜値＞as!＜型＞)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //エンティティを操作するためのオブジェクトを作成
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //Wordsエンティティオブジェクトを作成
        let Words = NSEntityDescription.entity(forEntityName: "Ideas", in: viewContext)
        
        //Wordsエンティティにレコード(行)を挿入するためのオブジェクトを作成
        let newRecord = NSManagedObject(entity: Words!, insertInto: viewContext)
        //③上記まで
        
        
        //追加したいdata(txtTitleに入力された文字)のセット
        newRecord.setValue(myLabel1.text, forKey: "title1")//値の代入
        newRecord.setValue(myLabel2.text, forKey: "title2")//値の代入
        newRecord.setValue(myLabel3.text, forKey: "title3")//値の代入
        
        newRecord.setValue(myTextView.text, forKey: "memo")//値の代入
        
        //Date型から文字列型に変更する
        df.dateFormat = "yyyy/MM/dd hh:mm"
        df.timeZone = TimeZone.ReferenceType.local

        let tapDate = df.string(from: now)
        
        newRecord.setValue(Date(),forKey: "saveDate")
        //Date():現在日時がセットできる
        
        
        
        words.append(myLabel1.text!)
        memo.append(myTextView.text!)
        
        print(df.string(from: now))
        
        //レコード（行）の即時保存
        do{
            try viewContext.save()
        }catch{
        }
        //read()
        //savetitleTableView.reloadData()
    
        
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
