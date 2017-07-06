//
//  FirstViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/06/27.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    @IBOutlet weak var txtTitle1: UILabel!
    
    @IBOutlet weak var txtTitle2: UILabel!
    
    @IBOutlet weak var txtTitle3: UILabel!
    

//    override func viewWillAppear(_ animated: Bool) {
//        
//    var words = ["恋","回","3","4","5","6","7","8","9","10","11","12","13"]

    
    
    
//        txtTitle1.text = words[r] as! String
//        
//        txtTitle2.text = words[s] as! String
//
//        txtTitle3.text = words[t] as! String
////
//    
//    }
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
            
            print(fetchResults)
            
            var n = fetchResults.count
            
            var r = Int(arc4random()) % n
            var s = Int(arc4random()) % n
            
            if r == n {
                if s == r {
                    s += 1
                }
            }
            
            var t = Int(arc4random()) % n
            if t == r || t == s {
                t += 1
            }
            
            var lock1 = true
            
            //ループで一行ずつ表示
            for result:AnyObject in fetchResults{
                let title: String = result.value(forKey:"title") as! String
                
                if n == r {
                    if lock1 == true {
                    txtTitle1.text = title
                    }
//                    txtTitle1.text = title
                }
                else if n == s {
                    txtTitle2.text = title
                }
                else if n == t {
                    txtTitle3.text = title
                }
                
                n -= 1
                
                let saveDate: Date = result.value(forKey:"saveDate") as! Date
                
                print("title:\(title) saveDate:\(saveDate)")
                
                
            }
            
            
            
        }catch{
            //エラーが起きた時に通常処理の代わりに行う処理を記述(例外処理を記述する場所)
        }
    }

    
    
   
    
//
//    switch r {
//        case 0:
//        txtTitle.text = UILabel
//    
//    }

    @IBAction func reshow(_ sender: UIButton) {
        read()
    }
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBAction func tapButtonToDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CoreDataからdataを読込
        read()
        
        

      
    }




    
    //メモリ不足のとき表示
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

