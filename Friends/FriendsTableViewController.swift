//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 15.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit
import FirebaseAuth

class FriendsTableViewController: UITableViewController {
    
    var friend: [FriendsList] = [FriendsList(name: "Pavel Durov", city: "St Petersburg", avatar: UIImage(named: "Pavel Durov")!),
                                 FriendsList(name: "Bill Gates", city: "Seattle", avatar: UIImage(named: "Bill Gates")!),
                                 FriendsList(name: "Mark Zuckerberg", city: "White Plains", avatar: UIImage(named: "Mark Zuckerberg")!),
                                 FriendsList(name: "Tim Cook", city: "Mobil", avatar: UIImage(named: "Tim Cook")!)]
    var headerTitle: [String] = ["B", "M", "P", "T"]
    
    
    private var filteredFriends  = [FriendsList]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater                 = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder                = "Search"
        navigationItem.searchController                       = searchController
        definesPresentationContext                            = true
        
        let header                                            = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 10 ))
        tableView.tableHeaderView                             = header
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriends.count
        }
        return friend.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell") as! FriendsTableViewCell
        
        let user: FriendsList
        
        if isFiltering {
            user = filteredFriends[indexPath.row]
        } else {
            user = friend[indexPath.row]
        }

        cell.friendName.text    = friend[indexPath.row].name
        cell.friendCity.text    = friend[indexPath.row].city
        cell.friendAvatar.image = friend[indexPath.row].avatar

        return cell
    }
    
    
    // Настроить segue при переходе после поиска в SearchBar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoCollectionViewController = segue.destination as? PhotosCollectionViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            photoCollectionViewController.photoList      = friend
            photoCollectionViewController.indexPathArray = indexPath
        }
    }

    //Выход из аккаунта
//    @IBAction func logOut() {
//        let storyboard = UIStoryboard(name: "Mail", bundle: nil)
//        let dvc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(dvc, animated: true)
//        do {
//            try.Auth.auth().signOut()
//        }
//    }
    
}


extension FriendsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredFriends = friend.filter({ (friendQ: FriendsList) -> Bool in
            return friendQ.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
