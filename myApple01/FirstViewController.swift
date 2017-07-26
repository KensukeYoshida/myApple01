//
//  FirstViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/06/27.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController{//,GADBannerViewDelegate {
    
//    //自分のAdMobIDを指定
//    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
//    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
//    
//    
//    let AdMobTest:Bool = true
//    let SimulatorTest:Bool = true

    
    @IBOutlet weak var txtTitle1: UILabel!
    
    @IBOutlet weak var txtTitle2: UILabel!
    
    @IBOutlet weak var txtTitle3: UILabel!
    
    @IBOutlet weak var imageLock1: UIImageView!
    
    @IBOutlet weak var imageLock2: UIImageView!
    
    @IBOutlet weak var imageLock3: UIImageView!
    
    
    
    var lock1 = true
    
    var lock2 = true
    
    var lock3 = true
    
    var words = [""]
    

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
            
            if r > 0 {
                if s == r {
                    s -= 1
                }
            }else{
                if s == r {
                 s += 1
                }
            }
            
            var t = Int(arc4random()) % n
            
            if t > 0 {
                if t == r {
                    t -= 1
                }
            }else{
                if t == r {
                    t += 1
                }
            }
            
            if t > 0 {
                if t == s {
                    t -= 1
                }
            }else{
                if t == s{
                    t += 1
                }
            }

           
            
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
                    if lock2 == true{
                    txtTitle2.text = title
                    }
                }
                else if n == t {
                    if lock3 == true {
                    txtTitle3.text = title
                    }
                }
                
                n -= 1
                
//                let saveDate: Date = result.value(forKey:"saveDate") as! Date
//                
//                print("title:\(title) saveDate:\(saveDate)")
                
                
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
    
//    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//    appDlegate.selectedWord1 = txtTitle1.text!
    
    
    @IBAction func tapButtonToDetail(_ sender: UIButton) {
        performSegue(withIdentifier: "showDetail", sender: nil)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.selectedWord1 = txtTitle1.text!
        appDelegate.selectedWord2 = txtTitle2.text!
        appDelegate.selectedWord3 = txtTitle3.text!
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //showAdBanner()

        
         self.title = "ひらめきの種"
        
        //ユーザーデフォルトを用意する
        let myDefault = UserDefaults.standard
        
        //データを読みだして
        let myStr = myDefault.string(forKey: "FirstFlag")
        
        //文字列が入ってたらSecondViewControllerを表示（2回目以降）
        if let tmpStr = myStr{
            print ("二回目以降表示")
            
        }else{
            // 文字が入ってなかったら初回起動時なので、FirstFlagに値を入れる
            myDefault.set("ON", forKey: "FirstFlag")
            myDefault.synchronize()
            
            //配列に用意している単語データをCoreDataに保存
            var startwords = ["カメラ","カメラ", "シンセサイザー", "地方","りんご","人工知能","電卓","音楽","お笑い","宗教","お祭り","動画","ドローン","インターネット","お酒","辞書","SNS","ドラッカー","野球","宇宙","時計","IoT","仏教","仮想現実","ラップ","コーヒー","メガネ","掃除","ペン","パソコン","ファッション","ロボット","医療","手帳","文具","アウトドア","車","電動","旅行","学校","幽霊","ゲーム","テレビ","海外","カフェ","留学","時間","金","ラーメン","寿司","女子高生","家","過疎","英語","拡張現実","銀行","仮想通貨","ビッグデータ","花火","Wifi","お洒落","ホテル", "スニーカー", "枕", "船", "飛行機", "東京", "サーフィン", "山", "海", "自動", "家族", "仏教", "プログラミング", "高速", "政治", "スケボー", "杖", "高齢", "夏休み", "倉庫", "空き家", "落語", "哲学", "映画","レゲエ","若者","ラーメン"]
            
            //Words:存在チェック
            for word:String in startwords{
             
            addword(addtext: word)
                
            }
                
            

        }
        
        
        //CoreDataからdataを読込
        read()
        
        

      
    }


    @IBAction func tapLock1(_ sender: UITapGestureRecognizer) {
        
        if lock1 == true {
            lock1=false
            imageLock1.image=UIImage(named: "key_ios.png")
        }else{
            lock1=true
            imageLock1.image=UIImage(named: "open_key_ios.png")
        }
        
    }
    
    @IBAction func tapLock2(_ sender: UITapGestureRecognizer) {
        
        if lock2 == true {
            lock2=false
            imageLock2.image=UIImage(named: "key_ios.png")
        }else{
            lock2=true
            imageLock2.image=UIImage(named: "open_key_ios.png")
        }
        

    }
    
    @IBAction func tapLock3(_ sender: UITapGestureRecognizer) {
    
        if lock3 == true {
            lock3=false
            imageLock3.image=UIImage(named: "key_ios.png")
        }else{
            lock3=true
            imageLock3.image=UIImage(named: "open_key_ios.png")
        }

    
    }
    
    //単語追加機能
    func addword(addtext:String){
        var checkFlag = false
        
        //Words:存在チェック
        for word:String in words{
            if addtext == word {
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
            newRecord.setValue(addtext, forKey: "title")//値の代入
            newRecord.setValue(Date(),forKey: "saveDate")
            //Date():現在日時がセットできる
            
            //レコード（行）の即時保存
            do{
                try viewContext.save()
            }catch{
            }
        }
    }

    
//    //広告を表示させる
//    func showAdBanner(){
//        
//        //バナー用のビューを作成
//        var admobView = GADBannerView()
//        
//        admobView = GADBannerView(adSize: kGADAdSizeBanner)
//        
//        //バナーを下に配置
//        admobView.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height - admobView.frame.height)
//        
//        //バナーを横幅いっぱいに配置
//        admobView.frame.size = CGSize(width: self.view.frame.width , height: admobView.frame.height)
//        
//        //各種設定
//        admobView.adUnitID = AdMobID
//        admobView.delegate = self as! GADBannerViewDelegate
//        admobView.rootViewController = self
//        
//        //広告のリクエスト
//        let admobRequest = GADRequest()
//        
//        //テストパターンによって設定を変える
//        if(AdMobTest == true){
//            //simulatorテスト
//            if(SimulatorTest == true){
//                admobRequest.testDevices = [kGADSimulatorID]
//                print("simulator")
//            }else{
//                //実機テスト
//                admobRequest.testDevices = [TEST_DEVICE_ID]
//                print("device")
//                
//            }
//            
//        }
//        
//        //リクエストのロード
//        admobView.load(admobRequest)
//        
//        //バナー画面に追加
//        self.view.addSubview(admobView)
//        
//        
//        
//    }
    //メモリ不足のとき表示
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
