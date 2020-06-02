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
        
        backgroundColor       = UIColor.clear
    }
    
    private func setShadow() {
        layer.shadowColor     = UIColor.black.cgColor
        layer.shadowOffset    = .zero
        layer.shadowRadius    = 5
        layer.shadowOpacity   = 100
        clipsToBounds         = true
        layer.masksToBounds   = false
    }
    
    // Добавить анимацию
    func compress() {
    }
    
}
