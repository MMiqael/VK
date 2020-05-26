//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friend: [FriendsList] = [FriendsList(name: "Pavel Durov", city: "St Petersburg", avatar: UIImage(named: "Pavel Durov")!),
    FriendsList(name: "Bill Gates", city: "Seattle", avatar: UIImage(named: "Bill Gates")!),
    FriendsList(name: "Mark Zuckerberg", city: "White Plains", avatar: UIImage(named: "Mark Zuckerberg")!),
    FriendsList(name: "Tim Cook", city: "Mobil", avatar: UIImage(named: "Tim Cook")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friend.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell") as! FriendsTableViewCell
        
        cell.friendName.text = friend[indexPath.row].name
        cell.friendCity.text = friend[indexPath.row].city
        cell.friendAvatar.image = friend[indexPath.row].avatar
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoCollectionViewController = segue.destination as? PhotosCollectionViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            photoCollectionViewController.photoList = friend
            photoCollectionViewController.indexPathArray = indexPath
        }
    }
    
}

struct FriendsList {
    var name: String
    var city: String
    var avatar: UIImage
}
