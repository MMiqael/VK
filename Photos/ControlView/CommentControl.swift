//
//  CommentControl.swift
//  VK
//
//  Created by Микаэл Мартиросян on 30.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class CommentControl: UIControl {

    var flag            = true
    var commentsCounter = UILabel(frame: CGRect(x: 27, y: 0, width: 43, height: 20))


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfig()
    }
    
    
    func setupConfig() {
        commentsCounter.textColor     = .gray
        commentsCounter.font          = UIFont.boldSystemFont(ofSize: 15)
        commentsCounter.textAlignment = .left

        addSubview(commentsCounter)
    }

    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }

    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if flag {
            commentsCounter.text = "954"
            flag                 = false
        } else {
            commentsCounter.text = ""
            flag                 = true
        }
    }
}
