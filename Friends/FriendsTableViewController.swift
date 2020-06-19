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
    
    @IBOutlet weak var friendsSearchBar: UISearchBar!
    
    var friendsArray: [FriendsStructure] = [FriendsStructure(name: "Pavel Durov",     city: "St Petersburg", avatar: UIImage(named: "Pavel Durov")!),
                                            FriendsStructure(name: "Bill Gates",      city: "Seattle",       avatar: UIImage(named: "Bill Gates")!),
                                            FriendsStructure(name: "Mark Zuckerberg", city: "White Plains",  avatar: UIImage(named: "Mark Zuckerberg")!),
                                            FriendsStructure(name: "Tim Cook",        city: "Mobil",         avatar: UIImage(named: "Tim Cook")!),
                                            FriendsStructure(name: "Larry Page",      city: "Lansing",       avatar: UIImage(named: "Larry Page")!),
                                            FriendsStructure(name: "Sergey Brin",     city: "Moscow",        avatar: UIImage(named: "Sergey Brin")!),
                                            FriendsStructure(name: "Steve Jobs",      city: "San Francisco", avatar: UIImage(named: "Steve Jobs")!),
                                            FriendsStructure(name: "Steve Wozniak",   city: "San José",      avatar: UIImage(named: "Steve Wozniak")!),
                                            FriendsStructure(name: "Paul Allen",      city: "Seattle",       avatar: UIImage(named: "Paul Allen")!),
                                            FriendsStructure(name: "Elon Musk",       city: "Pretoria",      avatar: UIImage(named: "Elon Musk")!)]
    
    var friendIndex: [String] = ["B", "M", "P", "T", "S", "L", "E"].sorted {$0 < $1}
        
    
    private var filteredFriends = [FriendsStructure]()
    var filtered = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsSearchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
    }
    
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if let searchBarText = searchBar.text {
//            filterText(searchBarText + text)
//        }
//        return true
//    }
    
    
    func filterText(_ query: String) {
        filteredFriends.removeAll()
        for friend in friendsArray {
            if friend.name.lowercased().starts(with: query.lowercased()) {
                filteredFriends.append(friend)
                print("\(query)")
            }
            tableView.reloadData()
        }
        filtered = true
    }
    
    
    // Высота хедера секции
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    // Имя хедера секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendIndex[section]
    }
    
    
    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        if !filteredFriends.isEmpty {
            return filteredFriends.count
        } else {
            return friendIndex.count
        }
    }
    
    
    // Контрол с буквами алфавита
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if !filteredFriends.isEmpty {
            return nil
        }
        return friendIndex
    }
    
    
    // Высота строки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    // Количесвто строк в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var friendRows = [FriendsStructure]()
        
        if !filteredFriends.isEmpty {
            return filteredFriends.count
        } else {
            for friend in friendsArray {
                if friendIndex[section].contains(friend.name.first!) {
                    friendRows.append(friend)
                }
            }
            return friendRows.count
        }
    }
    
    
    // Отображение ячейки в строке
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell") as! FriendsTableViewCell
        
        var friendRows = [FriendsStructure]()
        
        if !filteredFriends.isEmpty {
            
            cell.friendName.text = filteredFriends[indexPath.row].name
            cell.friendCity.text = filteredFriends[indexPath.row].city
            cell.friendAvatar.image = filteredFriends[indexPath.row].avatar
            
        } else {
            
            for friend in friendsArray {
                if friendIndex[indexPath.section].contains(friend.name.first!) {
                    friendRows.append(friend)
                }
            }
            cell.friendName.text    = friendRows[indexPath.row].name
            cell.friendCity.text    = friendRows[indexPath.row].city
            cell.friendAvatar.image = friendRows[indexPath.row].avatar
        }
        return cell
    }
    
    // Кратковременное подсвечивание при нажатии на ячейку - ???
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // Настроить segue при переходе после поиска в SearchBar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoCollectionViewController = segue.destination as? PhotosCollectionViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow {
            photoCollectionViewController.photoList = friendsArray
            photoCollectionViewController.indexPathArray = indexPath
        }
    }

    
    //Выход из аккаунта
//    @IBAction func logOut() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let dvc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.present(dvc, animated: true)
//        do {
//            try.Auth.auth().signOut()
//        }
//    }
    
}


extension FriendsTableViewController: UISearchBarDelegate {
}
