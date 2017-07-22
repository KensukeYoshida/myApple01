//
//  SaveViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/06.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//


import UIKit
import CoreData

class SaveViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var savetitleTableView: UITableView!
    
    //メンバ変数
    var words = [""]
    var words2 = [""]
    var words3 = [""]
    var time = [""]
    
    var wordsArray : [Ideas] = []
    
    let df = DateFormatter()
    
    let now = Date()

    
    //右上ボタンで編集・削除
    //@IBOutlet weak var rightButton: UIBarButtonItem!
    
    

        
    //選択された行番号(メンバ変数)
    var selectedIndex = -1 //全く選択されない時は-1が入っている
    
    //行数は numberOfRowsは決まり
    //->Int :戻り値のデータ型はInt型ですという意味
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    //表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字を表示するセルの取得(セルの再利用)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        let task = wordsArray[indexPath.row]
        //表示したい文字の設定
        //cell.textLabel?.text = "\(indexPath.row)"
        //cell.textLabel?.text = todo[indexPath.row]
        
        //文字色変更
        //cell.textLabel?.textColor = UIColor.brown
       
       
        cell.myLabel1?.text = task.value(forKey: "title1")as?String
        cell.myLabel2?.text = task.value(forKey: "title2")as?String
        cell.myLabel3?.text = task.value(forKey: "title3")as?String
        df.dateFormat = "yyyy/MM/dd/ HH:mm"
        df.timeZone = TimeZone.ReferenceType.local
        cell.saveDateLabel?.text = df.string(for: task.value(forKey: "saveDate")as?Date)
        
        
        
//        cell.myLabel1.text = words[indexPath.row]
//        cell.myLabel2.text = words2[indexPath.row]
//        cell.myLabel3.text = words3[indexPath.row]
    //  cell.saveDateLabel.text = time[indexPath.row]
        
        return cell
        
    }
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "一覧"


        //CoreDataからdataを読込処理
        read()
        
    }
    
  
    
    //④すでに存在するデータの読込処理
    func read(){
        //AppDelegateを使う用意しておく
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //エンティティを操作するためのオブジェクトを作成
        let viewContext = appDelegate.persistentContainer.viewContext
        
        //どのエンティティからデータを取得してくるか設定
        let query : NSFetchRequest<Ideas> = Ideas.fetchRequest()
//        query.sortDescriptors = [NSSortDescriptor(key:"saveDate", ascending: false)]
        
        //エラーが起きやすく、例外処理を書く必要がありそうな処理はdoで囲んでおく必要がある
        //例)CoreDataのようなDB処理、インターネット接続
        do{
            //降順かつCoreDateの取得し表示
            let fetchRequest : NSFetchRequest<Ideas> = Ideas.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key:"saveDate", ascending: false)]

            wordsArray = try viewContext.fetch(fetchRequest)
            
            //データを取得
//            let fetchResults = try viewContext.fetch(query)
//            wordsArray = try viewContext.fetch(Ideas.fetchRequest())
            
            //ループで一行ずつ表示
            for result:AnyObject in wordsArray{
                let title: String = result.value(forKey:"title1") as! String
                
                 let title2: String = result.value(forKey:"title2") as! String
                
                let title3: String = result.value(forKey:"title3") as! String
                
                
                
                
                
                let saveDate: Date = result.value(forKey:"saveDate") as! Date
                
                print("title1:\(title) title2:\(title) saveDate:\(saveDate)")
                
                df.dateFormat = "yyyy/MM/dd/ HH:mm"
                df.timeZone = TimeZone.ReferenceType.local

//                df.string(from: saveDate)/
                
                words.append(title)
                words2.append(title2)
                words3.append(title3)
                time.append(df.string(from: saveDate))
                
               
                

            }
            
            
            
        }catch{
            //エラーが起きた時に通常処理の代わりに行う処理を記述(例外処理を記述する場所)
        }
    }
    

//        //セルが選択（タップされた）時発動
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            //print("選択されたデータ:\(tea_list[indexPath.row])")
            
//            選択された行番号をメンバ変数に格納
            selectedIndex = indexPath.row
            
            //セグエを指定して画面移動
            performSegue(withIdentifier: "showDetail", sender: indexPath.row)
            
        }
    
    
        //セグエを使って次の画面へ移動するとき
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            //memoを
            if(segue.identifier == "showDetail"){
             let guest = segue.destination as! DetailViewController
                

                
            }
            
            
            //次の画面をインスタンス化(as:ダウンキャスト型変換) dvc（detail view controller）として次の画面を扱う
            var dvc = segue.destination as! DetailViewController
            
            
            
            //次の画面のプロパティに選択された行番号を指定
            dvc.sIndex = selectedIndex
            
        }
    
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        if editingStyle == .delete{
            let task = wordsArray[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                wordsArray = try context.fetch(Ideas.fetchRequest())
            }catch{
                print("Fetching Failed")
            }
            
            read()
            
        }
        tableView.reloadData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

