//
//  MyCell.swift
//  CocoaPodTest
//
//  Created by Chinh le on 5/29/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
