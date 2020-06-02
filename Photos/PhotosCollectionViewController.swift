//
//  PhotosCollectionViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 23.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var photoList: [FriendsList]  = []
    var indexPathArray: IndexPath = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! PhotosCollectionViewCell
    
        cell.photo.image = photoList[indexPathArray.row].avatar
    
        return cell
    }
}
