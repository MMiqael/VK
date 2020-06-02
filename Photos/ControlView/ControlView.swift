//
//  ControlView.swift
//  VK
//
//  Created by Микаэл Мартиросян on 31.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//
//
import UIKit

class ControlView: UIView {

    // Оутлеты вью от контролов
    @IBOutlet weak var likeControlView:     LikeControl! {
        didSet {
            likeControlView.frame              = CGRect(x: 10, y: 10, width: 70, height: 20)
            likeControlView.backgroundColor    = .clear
        }
    }

    @IBOutlet weak var commentControlView:  CommentControl! {
        didSet {
            commentControlView.frame           = CGRect(x: 90, y: 10, width: 70, height: 20)
            commentControlView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var shareControlView:    ShareControl! {
        didSet {
            shareControlView.frame             = CGRect(x: 170, y: 10, width: 70, height: 20)
            shareControlView.backgroundColor   = .clear
        }
    }
    
    @IBOutlet weak var viewControlView:     ViewControl! {
        didSet {
            viewControlView.frame              = CGRect(x: 303, y: 10, width: 62, height: 20)
            viewControlView.backgroundColor    = .clear
        }
    }
    
    
    // Аутлеты кнопок
    @IBOutlet weak var commentButtonSetup: UIButton!
    

    @IBOutlet weak var shareButtonSetup:   UIButton!
    
    
    // Экшны кнопок
    @IBAction func commentButton(_ sender: UIButton){
        print("tryComment")
    }

    @IBAction func shareButton(_ sender:   UIButton) {
        print("tryShare")
    }
}
