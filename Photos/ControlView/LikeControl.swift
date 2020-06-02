//
//  LikeControl.swift
//  VK
//
//  Created by Микаэл Мартиросян on 28.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    
    var flag                       = true
    var likesCounter               = UILabel(frame: CGRect(x: 27, y: 0, width: 43, height: 20))
    var likeIcon                   = UIImage(systemName: "heart")
    var imageView                  = UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfig()
    }
    
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfig()
    }
    
    
    func setupConfig() {
        // Стартовые настройки imageView
        imageView                  = UIImageView(frame: CGRect(x: 0, y: 0, width: 26, height: 20))
        imageView.image            = likeIcon
        imageView.tintColor        = .gray
        
        // При условии, что уже поставлены лайки
        likesCounter.textColor     = .gray
        likesCounter.textAlignment = .left
        likesCounter.font          = UIFont.boldSystemFont(ofSize: 15)
    
        addSubview(imageView)
        addSubview(likesCounter)
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if flag {
            likeIcon               = UIImage(systemName: "heart.fill")
            
            imageView.image        = likeIcon
            imageView.tintColor    = .red
            
            likesCounter.textColor = .red
            likesCounter.text      = "954"
            
            flag                   = false
        } else {
            likeIcon               = UIImage(systemName: "heart")
            
            imageView.image        = likeIcon
            imageView.tintColor    = .gray
            
            likesCounter.text      = ""
        
            flag                   = true
        }
    }
}
