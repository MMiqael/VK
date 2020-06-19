//
//  LikeControl.swift
//  VK
//
//  Created by Микаэл Мартиросян on 28.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    
    var flag = true
    var likesCounter = UILabel(frame: CGRect(x: 27, y: 0, width: 43, height: 20))
    var likeIcon = UIImage(systemName: "heart")
    var imageView = UIImageView()
    
    
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
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 26, height: 20))
        imageView.image = likeIcon
        imageView.tintColor = .gray
        
        // При условии, что уже поставлены лайки
        likesCounter.text = "953"
        likesCounter.textColor = .gray
        likesCounter.textAlignment = .left
        likesCounter.font = UIFont.boldSystemFont(ofSize: 15)
        likesCounter.backgroundColor = .clear
        
        addSubview(imageView)
        addSubview(likesCounter)
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        let heartIncrease = self.imageView.transform
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.25, options: .autoreverse, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.transform = heartIncrease
        })
        
        if flag {
            likeIcon = UIImage(systemName: "heart.fill")
            imageView.image = likeIcon
            likesCounter.textColor = .red
            flag = false
            
            
            
            UIView.transition(with: imageView, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.imageView.tintColor = .red
            })
            
            UIView.transition(with: likesCounter, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.likesCounter.text = "954"
            })
            
        } else {
            likeIcon = UIImage(systemName: "heart")
            imageView.image = likeIcon
            likesCounter.textColor = .gray
            flag = true
            
            let heartDecrease = self.imageView.transform
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.25, options: .autoreverse, animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }, completion: { _ in
                self.transform = heartDecrease
            })
            
            UIView.transition(with: imageView, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.imageView.tintColor = .gray
            })
            
            UIView.transition(with: likesCounter, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.likesCounter.text = "953"
            })
        }
    }
}
