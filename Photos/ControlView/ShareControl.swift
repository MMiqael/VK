//
//  ShareControl.swift
//  VK
//
//  Created by Микаэл Мартиросян on 31.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class ShareControl: UIControl {

    var flag         = true
    var shareCounter = UILabel(frame: CGRect(x: 27, y: 0, width: 43, height: 20))
    var imageView    = UIImageView()

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfig()
    }
            
    
    func setupConfig() {
        shareCounter.font          = UIFont.boldSystemFont(ofSize: 15)
        shareCounter.textAlignment = .left
        shareCounter.textColor     = .gray

        addSubview(imageView)
        addSubview(shareCounter)
    }

    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }

    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if flag {
            shareCounter.text   = "954"
            flag                = false
        } else {
            imageView.tintColor = .gray
            shareCounter.text   = ""
            flag                = true
        }
    }
}
