//
//  MessafegeTableViewCell.swift
//  FlashChat
//
//  Created by MAC on 03/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class MessafegeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
//        label.layer.cornerRadius = 30
        // Initialization code
    }

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var avtar: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var LeftBtn: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
}
