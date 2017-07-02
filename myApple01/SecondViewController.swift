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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func tapReturn(_ sender: UITextField) {
    }
    
    //OKボタン押された時、CoreDate追加
    @IBAction func tapSave(_ sender: UIButton) {
       
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
        }catch{
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

