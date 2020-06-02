//
//  GroupsTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var groups = [GroupSearchList] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addGroup (segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let groupSearchTableViewController = segue.source as? GroupSearchTableViewController else {return}
            if let indexPath = groupSearchTableViewController.tableView.indexPathForSelectedRow {
                let group = groupSearchTableViewController.groupSearch[indexPath.row]
                if !groups.contains(group) {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCell") as! GroupsTableViewCell
        
        cell.groupsName.text = groups[indexPath.row].name
        cell.groupsAvatar.image = groups[indexPath.row].avatar
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
