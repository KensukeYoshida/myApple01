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
    
    var memo = [""]
    
    var sIndex = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        myLabel1.text = appDelegate.selectedWord1
        myLabel2.text = appDelegate.selectedWord2
        myLabel3.text = appDelegate.selectedWord3
        var amountText = [appDelegate.selectedWord1,appDelegate.selectedWord2,appDelegate.selectedWord3]
        
        appDelegate.amount.adding(amountText)
        

        // Do any additional setup after loading the view.
        
        
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
        
        
        newRecord.setValue(Date(),forKey: "saveDate")
        //Date():現在日時がセットできる
        
        words.append(myLabel1.text!)
        memo.append(myTextView.text!)
        
        //レコード（行）の即時保存
        do{
            try viewContext.save()
        }catch{
        }
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
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
