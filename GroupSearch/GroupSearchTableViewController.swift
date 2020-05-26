//
//  GroupSearchTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class GroupSearchTableViewController: UITableViewController {

    let groupSearch: [GroupSearchList] = [GroupSearchList(name: "Wylsacom", avatar: UIImage(named: "Wylsacom")!),
    GroupSearchList(name: "вДудь", avatar: UIImage(named: "vDud")!),
    GroupSearchList(name: "Microsoft", avatar: UIImage(named: "Microsoft")!),
    GroupSearchList(name: "Facebook", avatar: UIImage(named: "Facebook")!),
    GroupSearchList(name: "GeekBrains portal", avatar: UIImage(named: "GeekBrains")!),
    GroupSearchList(name: "Apple", avatar: UIImage(named: "Apple")!),
    GroupSearchList(name: "Learn Swift", avatar: UIImage(named: "Swift")!)]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupSearch.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupSearchCell") as! GroupSearchTableViewCell

        cell.groupSearchName.text = groupSearch[indexPath.row].name
        cell.groupSearchAvatar.image = groupSearch[indexPath.row].avatar
            
        return cell
    }
}

struct GroupSearchList: Equatable {
     var name: String
     var avatar: UIImage
 }
