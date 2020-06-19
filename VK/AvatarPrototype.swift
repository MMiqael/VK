//
//  AvatarPrototype.swift
//  VK
//
//  Created by Микаэл Мартиросян on 01.06.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class AvatarPrototype: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAvatar()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAvatar()
    }
    
    
    func setupAvatar() {
        setShadow()
        compression()
        
        backgroundColor       = UIColor.clear
    }
    
//    var avatarImage: UIImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private func setShadow() {
        layer.shadowColor     = UIColor.black.cgColor
        layer.cornerRadius = CGFloat(self.frame.width / 2)
        layer.shadowOffset    = .zero
        layer.shadowRadius    = 3
        layer.shadowOpacity   = 0.7
        clipsToBounds         = true
        layer.masksToBounds   = false
        
//        avatarImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//        avatarImage.contentMode = .scaleAspectFill
//        avatarImage.layer.cornerRadius = CGFloat(self.frame.width / 2)
//        avatarImage.layer.masksToBounds = true
//
//        self.addSubview(avatarImage)
    }
    
    
    func compression() {
        
        let press = UITapGestureRecognizer(target: self, action: #selector(compress))
        addGestureRecognizer(press)
    }
    
    @objc func compress(gestureRecignizer: UITapGestureRecognizer) {
        
        let setupConfig = self.transform
        UIView.animate(withDuration: 0.25, delay: 0,usingSpringWithDamping: 1.0,
        initialSpringVelocity: 0.25, options: .autoreverse, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            self.transform = setupConfig
        })
        
    }
}

