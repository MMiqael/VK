//
//  Avatar.swift
//  VK
//
//  Created by Микаэл Мартиросян on 25.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

//import UIKit
//
//@IBDesignable class Avatar: UIView {
//
//    @IBInspectable var bgColor: UIColor = .white {
//        didSet {
//            self.bgColorSet()
//        }
//    }
//
//    @IBInspectable var shadow: Float = 1 {
//        didSet {
//            self.shadowSet()
//        }
//    }
//
//    func bgColorSet() {
//        self.layer.backgroundColor = bgColor.cgColor
//        self.layer.cornerRadius = layer.frame.width / 2
//        self.layer.shadowColor = UIColor.gray.cgColor
//    }
//
//    func shadowSet() {
//        self.layer.shadowOpacity = shadow
//        self.layer.shadowRadius = 5
//        self.layer.shadowOffset = .zero
//    }
//}

import UIKit

class Avatar: UIView {
    
    var avatar = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setNeedsDisplay()
    }
    
    override func setNeedsDisplay() {
        
        avatar = UIImageView(frame: layer.bounds)
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = self.avatar.frame.size.width / 2
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = avatar.frame.width / 2
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        layer.shadowOffset = .zero   //CGSize(width: 2, height: 0)
        self.addSubview(avatar)
    }
}
