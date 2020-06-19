//
//  GroupSearchTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class GroupSearchTableViewController: UITableViewController {
    
    let groupSearch: [GroupSearchStructure] = [GroupSearchStructure(name: "Wylsacom",   avatar: UIImage(named: "Wylsacom")!),
                                               GroupSearchStructure(name: "вДудь",      avatar: UIImage(named: "vDud")!),
                                               GroupSearchStructure(name: "Microsoft",  avatar: UIImage(named: "Microsoft")!),
                                               GroupSearchStructure(name: "Facebook",   avatar: UIImage(named: "Facebook")!),
                                               GroupSearchStructure(name: "GeekBrains", avatar: UIImage(named: "GeekBrains")!),
                                               GroupSearchStructure(name: "Apple",      avatar: UIImage(named: "Apple")!),
                                               GroupSearchStructure(name: "SwiftBook",  avatar: UIImage(named: "SwiftBook")!)]
    
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
