//
//  FriendsTableViewCell.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet var contentFriendsCell: UIView!
    
    @IBOutlet weak var avatarView:    AvatarPrototype! 
    
    
    @IBOutlet weak var friendAvatar:  UIImageView! {
        didSet {
            friendAvatar.layer.cornerRadius = self.friendAvatar.frame.size.width / 2
            friendAvatar.contentMode = .scaleAspectFill
        }
    }

    
    @IBOutlet weak var friendName:    UILabel! {
        didSet {
            friendName.textColor = .black
            friendName.font      = .systemFont(ofSize: 15)
        }
    }
    
    
    @IBOutlet weak var friendCity:    UILabel! {
        didSet {
            friendCity.textColor = .lightGray
            friendCity.font      = .systemFont(ofSize: 12)
        }
    }
    
    @IBAction func friendAvatar (_ sender: AvatarPrototype) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
