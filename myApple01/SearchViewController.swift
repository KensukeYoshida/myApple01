//
//  SearchViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/07.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,XMLParserDelegate {
    
    
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

    @IBOutlet weak var txtSearchword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func tapReturn(_ sender: UITextField) {
        
        // XML解析実行
        //一旦1にリセット
        myCount = 1
        
        loadxml()

        
    }
   
    
    @IBAction func tapResearchBtn(_ sender: UIButton) {
        
        // XML解析実行
        //一旦1にリセット
        myCount = 1
        
        loadxml()
        

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func leftSwiped() {
        NSLog("leftSwiped");
    }
    
    @IBAction func rightSwiped() {
        NSLog("rightSwiped");
    }
    
    @IBAction func upSwiped() {
        NSLog("upSwiped");
    }
    
    @IBAction func downSwiped() {
        NSLog("downSwiped");
    }
    
    
    func loadxml(){
    
        //URLエンコードを行い、URLの一部を作成
        let encodedString = CFURLCreateStringByAddingPercentEscapes(
            nil,
            txtSearchword.text as CFString!,
            nil,
            "!*'();:@&=+$,/?%#[]" as CFString!,
            CFStringBuiltInEncodings.UTF8.rawValue) as String
        
        print(txtSearchword.text)
        
        
        let url_text = "http://www.google.com/complete/search?hl=en&q="+encodedString+"&output=toolbar".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        
        
        
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
    }
    
    // 解析中に要素の終了タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("終了タグ:" + elementName)
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
