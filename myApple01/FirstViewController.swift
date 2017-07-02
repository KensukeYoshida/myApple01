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
    
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var txtTitle2: UILabel!
    
    @IBOutlet weak var txtTitle3: UILabel!
    

    override func viewWillAppear(_ animated: Bool) {
        
        var words = ["辞書","Bluetooth","ソーラー","財布","電卓","ペン","人工知能","オークション","ドローン","VR","シンセサイザー","ライト","ペン","机","イス","車","コップ","メガネ"]
        
        let r = Int(arc4random()) % words.count
        let s = Int(arc4random()) % words.count
        let t = Int(arc4random()) % words.count
        
        txtTitle.text = words[r] as! String
        
        txtTitle2.text = words[s] as! String

        txtTitle3.text = words[t] as! String

    
    }
    
   
    
//
//    switch r {
//        case 0:
//        txtTitle.text = UILabel
//    
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    //メモリ不足のとき表示
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

