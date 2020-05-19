//
//  UserTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var user: [UserList] = [UserList(name: "Pavel Durov", city: "St Petersburg", avatar: UIImage(named: "Pavel Durov")!),
    UserList(name: "Bill Gates", city: "Seattle", avatar: UIImage(named: "Bill Gates")!),
    UserList(name: "Mark Zuckerberg", city: "White Plains", avatar: UIImage(named: "Mark Zuckerberg")!),
    UserList(name: "Tim Cook", city: "Mobil", avatar: UIImage(named: "Tim Cook")!)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell") as! FriendsTableViewCell
        
        cell.userName.text = user[indexPath.row].name
        cell.userCity.text = user[indexPath.row].city
        cell.userAvatar.image = user[indexPath.row].avatar
        
        return cell
    }
}

struct UserList {
    var name: String
    var city: String
    var avatar: UIImage
}
