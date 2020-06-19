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
//            photoCell.frame.size.height = photo.frame.size.height + controlView.frame.size.height
        }
    }
    
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            // Узнать как рассчитать автоматическое вычисление высоты картинки
            photo.frame.size.width  = contentView.frame.size.width
        }
    }
    
    @IBOutlet weak var controlView: UIView! {
        didSet {
            controlView.frame.size.width  = contentView.frame.size.width
            controlView.frame.size.height = 40
            controlView.backgroundColor   = .clear
        }
    }
}
