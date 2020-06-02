//
//  ViewControl.swift
//  VK
//
//  Created by Микаэл Мартиросян on 31.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class ViewControl: UIControl {

    var flag         = true
    var viewsCounter = UILabel(frame: CGRect(x: 27, y: 0, width: 43, height: 20))
    var viewIcon     = UIImage(systemName: "eye.fill")
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
        // Стартовые настройки imageView
        imageView                  = UIImageView(frame: CGRect(x: 0, y: 4, width: 18, height: 12))
        imageView.image            = viewIcon
        imageView.tintColor        = .lightGray
            
        // При условии, что уже есть просмотры
        viewsCounter.font          = .systemFont(ofSize: 15)
        viewsCounter.textAlignment = .left
        viewsCounter.textColor     = .lightGray
        
        addSubview(imageView)
        addSubview(viewsCounter)
    }
        
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if flag {
            viewsCounter.text = "954"
            flag              = false
        } else {
            viewsCounter.text = ""
            flag              = true
        }
    }
}
