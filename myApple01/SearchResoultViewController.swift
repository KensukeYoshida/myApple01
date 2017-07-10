//
//  SearchResoultViewController.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/07.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit

class SearchResoultViewController: UIViewController,XMLParserDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var word_list = ["","","","","","","","","","","","","","","","","","","",""]
    
    var myCount = 1
    
    @IBOutlet weak var txtSearchWord: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func tapReturn(_ sender: UITextField) {
        
        // XML解析実行
        //一旦1にリセット
        myCount = 1
        
        loadxml()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //①セルの個数(行数)を指定するデリゲートメソッド（必須）
    //行数はnumberOfRowsで決まり　打つと自動変換で出来る
    //->Int :戻り値のデータ型はInt型ですという意味
    //UITableViewとはリスト。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word_list.count
    }
    
    
   
    // XMLを解析する
    func loadxml(){
        
        //URLエンコードを行い、URLの一部を作成
        let encodedString = CFURLCreateStringByAddingPercentEscapes(
            nil,
            txtSearchWord.text as CFString!,
            nil,
            "!*'();:@&=+$,/?%#[]" as CFString!,
            CFStringBuiltInEncodings.UTF8.rawValue) as String
        
        
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
            
            switch myCount{
            case 1:
                word_list[0] = attributeDict["data"]!
                word_list[1] = attributeDict["data"]!
                word_list[2] = attributeDict["data"]!
                word_list[3] = attributeDict["data"]!
                word_list[4] = attributeDict["data"]!
                word_list[5] = attributeDict["data"]!
                word_list[6] = attributeDict["data"]!
                word_list[7] = attributeDict["data"]!
                word_list[8] = attributeDict["data"]!
                word_list[9] = attributeDict["data"]!
                word_list[10] = attributeDict["data"]!
                word_list[11] = attributeDict["data"]!
                word_list[12] = attributeDict["data"]!
                word_list[13] = attributeDict["data"]!
                word_list[14] = attributeDict["data"]!
                word_list[15] = attributeDict["data"]!
                word_list[16] = attributeDict["data"]!
                word_list[17] = attributeDict["data"]!
                word_list[18] = attributeDict["data"]!
                word_list[19] = attributeDict["data"]!
                word_list[20] = attributeDict["data"]!
                
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
    
    //②セルに値を設定するデータソースメソッド（必須）
    //表示させるセルの中身
    //1つの項目を表示する領域を「セル」と言います。
    //セルには、UITableViewCellというものを使用します
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var word_list = ["","","","","","","","","","","","","","","","","","","",""]
        
        //文字を表示するセルの取得(セルの再利用)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //表示したい文字の設定
        //cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.text = word_list[indexPath.row]
        
        //文字色変更
        cell.textLabel?.textColor = UIColor.brown
        
        //アクセサリをつける
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
        
        
    }

    

    
