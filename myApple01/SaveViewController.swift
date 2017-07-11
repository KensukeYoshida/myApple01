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
    
    //行数は numberOfRowsは決まり
    //->Int :戻り値のデータ型はInt型ですという意味
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    //表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字を表示するセルの取得(セルの再利用)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        //表示したい文字の設定
        //cell.textLabel?.text = "\(indexPath.row)"
        //cell.textLabel?.text = todo[indexPath.row]
        
        //文字色変更
        //cell.textLabel?.textColor = UIColor.brown
        cell.myLabel1.text = words[indexPath.row]
        cell.myLabel2.text = words[indexPath.row]
        cell.saveDateLabel.text = "表示したい日付"
        
        return cell
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        //エラーが起きやすく、例外処理を書く必要がありそうな処理はdoで囲んでおく必要がある
        //例)CoreDataのようなDB処理、インターネット接続
        do{
            //データを取得
            let fetchResults = try viewContext.fetch(query)
            
            //ループで一行ずつ表示
            for result:AnyObject in fetchResults{
                let title: String = result.value(forKey:"title1") as! String
                
                let saveDate: Date = result.value(forKey:"saveDate") as! Date
                
                print("title1:\(title) saveDate:\(saveDate)")
                
                words.append(title)
            }
            
            
            
        }catch{
            //エラーが起きた時に通常処理の代わりに行う処理を記述(例外処理を記述する場所)
        }
        
        
        func read(){
            //AppDelegateを使う用意しておく
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            //エンティティを操作するためのオブジェクトを作成
            let viewContext = appDelegate.persistentContainer.viewContext
            
            //どのエンティティからデータを取得してくるか設定
            let query : NSFetchRequest<Ideas> = Ideas.fetchRequest()
            
            //エラーが起きやすく、例外処理を書く必要がありそうな処理はdoで囲んでおく必要がある
            //例)CoreDataのようなDB処理、インターネット接続
            do{
                //データを取得
                let fetchResults = try viewContext.fetch(query)
                
                //ループで一行ずつ表示
                for result:AnyObject in fetchResults{
                    let title: String = result.value(forKey:"title2") as! String
                    
                    let saveDate: Date = result.value(forKey:"saveDate") as! Date
                    
                    print("title2:\(title) saveDate:\(saveDate)")
                    
                    words.append(title)
                }
                
                
                
            }catch{
                //エラーが起きた時に通常処理の代わりに行う処理を記述(例外処理を記述する場所)
            }
            

        //データを一括取得
        
        //ループで一行ずつ表示
        
        
        
    }

    
    
    

    func didReceiveMemoryWarning() {
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

}
}
