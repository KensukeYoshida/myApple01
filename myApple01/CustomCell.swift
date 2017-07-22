//
//  CustomCell.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/11.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var saveDateLabel: UILabel!
    
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var myLabel3: UILabel!
    
    

    var words = [""]
    var words2 = [""]
    var words3 = [""]
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
