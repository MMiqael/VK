//
//  FriendsTableViewCell.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
