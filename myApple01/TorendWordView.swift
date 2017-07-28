//
//  TorendWordView.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/26.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit
import CoreData

class TorendWordView: UIViewController,XMLParserDelegate,UITextFieldDelegate {
    
    
    @IBOutlet weak var myTxtField1: UITextField!
    
    @IBOutlet weak var myTxtField2: UITextField!
    
    @IBOutlet weak var myTxtField3: UITextField!
    
    @IBOutlet weak var myTxtField4: UITextField!
    
    @IBOutlet weak var myTxtField5: UITextField!
    
    @IBOutlet weak var myTxtField6: UITextField!
    
    @IBOutlet weak var myTxtField7: UITextField!
    
    @IBOutlet weak var myTxtField8: UITextField!
    
    @IBOutlet weak var myTxtField9: UITextField!
    
    @IBOutlet weak var myTxtField10: UITextField!
    
    var myCount = 1
    
    var titleFlag = false


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "トレンドワード"
        
        //makeKeybord()
        
        loadxml()
        
    }
    
    @IBAction func myTxtField1(_ sender: UITextField) {
    }
      
    @IBAction func myTxtField2(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField3(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField4(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField5(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField6(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField7(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField8(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField9(_ sender: UITextField) {
    }
    
    
    @IBAction func myTxtField10(_ sender: UITextField) {
    }
    
    @IBAction func tapAddBtn1(_ sender: UIButton) {
        
        addword(addtext: myTxtField1.text!)
        
    }
    
    @IBAction func tapAddBtn2(_ sender: UIButton) {
        
        addword(addtext: myTxtField2.text!)
        
    }
    
    
    @IBAction func tapAddBtn3(_ sender: UIButton) {
        
        addword(addtext: myTxtField3.text!)
        
    }
    
    
    @IBAction func tapAddBtn4(_ sender: UIButton) {
        
        addword(addtext: myTxtField4.text!)
    }
    
    
    @IBAction func tapAddBtn5(_ sender: UIButton) {
        
        addword(addtext: myTxtField5.text!)
    }
    
    
    @IBAction func tapAddBtn6(_ sender: UIButton) {
        
        addword(addtext: myTxtField6.text!)
    }
    
    
    @IBAction func tapAddBtn7(_ sender: UIButton) {
        
        addword(addtext: myTxtField7.text!)
    }
    
    
    @IBAction func tapAddBtn8(_ sender: UIButton) {
        
        addword(addtext: myTxtField8.text!)
    }
    
    
    @IBAction func tapAddBtn9(_ sender: UIButton) {
        
        addword(addtext: myTxtField9.text!)
    }
    
    
    @IBAction func tapAddBtn10(_ sender: UIButton) {
        
        addword(addtext: myTxtField10.text!)
    }

    
    //単語追加機能
    func addword(addtext:String){
        var checkFlag = false
        
        //Words:存在チェック
//        for word:String in words{
//            if addtext == word {
//                checkFlag = true
//            }
//        
//        }
        
        
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
               
        kbToolBar.items = [spacer, commitButton]
        myTxtField1.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField2.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField3.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField4.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField5.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField6.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField7.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField8.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField9.inputAccessoryView = kbToolBar
        
        kbToolBar.items = [spacer, commitButton]
        myTxtField10.inputAccessoryView = kbToolBar
    }
    func commitButtonTapped (){
        self.view.endEditing(true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadxml(){
        
//        //URLエンコードを行い、URLの一部を作成
//        let encodedString = CFURLCreateStringByAddingPercentEscapes(
//            nil,
//            txtSearchword.text as CFString!,
//            nil,
//            "!*'();:@&=+$,/?%#[]" as CFString!,
//            CFStringBuiltInEncodings.UTF8.rawValue) as String
        
        
        let url_text = "http://www.nilab.info/buzztube/buzztube.xml"
        
        
        
        
        let url = URL(string: url_text)
        
        // インターネット上のXMLを取得し、NSXMLParserに読み込む
        let parser = XMLParser(contentsOf: url!)
        
        parser?.delegate = self;
        parser?.parse()
    }
    
    // XML解析開始時に実行されるメソッド
    func parserDidStartDocument(_ parser: XMLParser) {
        print("XML解析開始しました")
    }
    
    // 解析中に要素の開始タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("開始タグ:" + elementName)
        
        if elementName == "title"{
            titleFlag=true
        }
        
        if elementName == "suggestion"{
            print(attributeDict["data"])
            
            switch myCount {
            case 1:
                myTxtField1.text = attributeDict["data"]!
            case 2:
                myTxtField2.text = attributeDict["data"]!
            case 3:
                myTxtField3.text = attributeDict["data"]!
            case 4:
                myTxtField4.text = attributeDict["data"]!
            case 5:
                myTxtField5.text = attributeDict["data"]!
            case 6:
                myTxtField6.text = attributeDict["data"]!
            case 7:
                myTxtField7.text = attributeDict["data"]!
            case 8:
                myTxtField8.text = attributeDict["data"]!
            case 9:
                myTxtField9.text = attributeDict["data"]!
            case 10:
                myTxtField10.text = attributeDict["data"]!
                
            default:
                print(myCount)
            }
            
            myCount += 1
        }
    }
    
    // 開始タグと終了タグでくくられたデータがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("要素:" + string)
        
        if titleFlag {
            
            switch myCount {
            case 1:
                myTxtField1.text = string
            case 2:
                myTxtField2.text = string
            case 3:
                myTxtField3.text = string
            case 4:
                myTxtField4.text = string
            case 5:
                myTxtField5.text = string
            case 6:
                myTxtField6.text = string
            case 7:
                myTxtField7.text = string
            case 8:
                myTxtField8.text = string
            case 9:
                myTxtField9.text = string
            case 10:
                myTxtField10.text = string
                
            default:
                print(myCount)
            }
            
            myCount += 1

        }
    }
    
    // 解析中に要素の終了タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("終了タグ:" + elementName)
        
        if elementName == "title"{
            titleFlag=false
        }
    }
    
    // XML解析終了時に実行されるメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        print("XML解析終了しました")
    }
    
    // 解析中にエラーが発生した時に実行されるメソッド
    private func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {
        print("エラー:" + parseError.localizedDescription)
    }

}
