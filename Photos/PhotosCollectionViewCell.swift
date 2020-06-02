//
//  PhotosCollectionViewCell.swift
//  VK
//
//  Created by Микаэл Мартиросян on 23.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoCell: UICollectionView! {
        didSet {
            photoCell.frame.size.width  = 375
            photoCell.frame.size.height = 641
        }
    }
    
    
    @IBOutlet weak var contentPhotosCell: UIView! {
        didSet {
            
            contentPhotosCell.frame.size.width  = 375
            contentPhotosCell.frame.size.height = 641
            
            contentPhotosCell.trailingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 0).isActive = true
            contentPhotosCell.trailingAnchor.constraint(equalTo: controlView.trailingAnchor, constant: 0).isActive = true
        }
    }
    
    
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            // Узнать как рассчитать автоматическое вычисление высоты картинки
            photo.frame.size.width  = 375
            photo.frame.size.height = 375
            
//            photo.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
//            photo.topAnchor.constraint(equalTo: content.topAnchor, constant: 0).isActive = true
        }
    }
    
    
    @IBOutlet weak var controlView: UIView! {
        didSet {
            controlView.frame.size.width  = 375
            controlView.frame.size.height = 40
            controlView.backgroundColor   = .clear
            
//            controlView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
//            controlView.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 0).isActive = true
        }
    }
}
