//
//  SearchVC.swift
//  MySuperStar
//
//  Created by lodex solutions on 1/6/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import UIKit
class SearchVC: BaseVC {
    var search_result_cellID = "search_resultCell"
    @IBOutlet weak var search_bar: UISearchBar!
    @IBOutlet weak var search_tableview: UITableView!
    
    override func setupOutlets() {
        search_tableview.dataSource = self
        search_tableview.delegate = self
        search_tableview.register(UINib(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: search_result_cellID)
    }
    
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: search_result_cellID, for: indexPath) as? SearchResultCell else { return UITableViewCell() }
        cell.textLabel?.text = "Test"
        return cell
        
    }
    
    
}
extension SearchVC: UITableViewDelegate {
    
}
 // MARK: Search Bar Methods
//extension SearchVC: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        todos = todos?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: false)
//        tableView.reloadData()
//
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == "" {
//            tableView.reloadData()
//            DispatchQueue.main.async {
//            searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
