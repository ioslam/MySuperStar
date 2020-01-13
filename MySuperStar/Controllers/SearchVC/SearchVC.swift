//
//  SearchVC.swift
//  MySuperStar
//
//  Created by lodex solutions on 1/6/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
class SearchVC: BaseVC {
    
    var search_result_cellID = "search_resultCell"
    private var result: [Result]? = []
    private var isloading = false
    private var currentPage = 1
    private var lastPage = 1
    private var searchName : String?
    @IBOutlet weak var search_bar: UISearchBar!
    @IBOutlet weak var search_tableview: UITableView!
    
    override func setupOutlets() {
        search_tableview.rowHeight = 80
        search_tableview.contentInset = .zero
        search_tableview.tableFooterView  = UIView()
        search_tableview.dataSource = self
        search_tableview.delegate = self
        search_bar.delegate = self
        search_tableview.register(UINib(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: search_result_cellID)
        search_bar.becomeFirstResponder()
    }
    
        ///Loading more data by adding +1 to page parameter
    fileprivate func loadMore() {
        guard !isloading else {return}
        guard currentPage < lastPage else {return}
        isloading = true
        
        PopularPeopleDataProvider.getQuery(page: currentPage+1, name: searchName!) { (searchQuery, lastPage) in
            
            for data in searchQuery.results {
                self.result?.append(data)
            }
            self.isloading = false
            self.search_tableview.reloadData()
            self.currentPage += 1
            self.lastPage = lastPage
        }
    }
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: search_result_cellID, for: indexPath) as? SearchResultCell else { return UITableViewCell() }
        cell.name_label?.text = result?[indexPath.row].name ?? "Unknown"
        cell.displayImg(URLString: result?[indexPath.row].profilePath ?? "")
        cell.selectionStyle = .none
        return cell
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = self.result![indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "detailsVCx") as! DetailsVC
        VC.results = person

        present(VC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let count = self.result?.count
        if indexPath.row == count!-1{
            //load more
            self.loadMore()
        }
    }
}

extension SearchVC: UISearchBarDelegate {
    // MARK: Search Bar Methods
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if Reachability.isConnectedToNetwork(){
            
            let searchTxt = searchText.replacingOccurrences(of: " ", with: "-")
            self.searchName = searchTxt
            guard !isloading else {return}
            isloading = true
            PopularPeopleDataProvider.getQuery(name: searchTxt) { (searchQuery, lastpage) in
                self.result = searchQuery.results
                self.isloading = false
                self.search_tableview.reloadData()
                self.currentPage = 1
                self.lastPage = lastpage
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel) { (UIAlertAction) in
                print("No Internet Connection")
            }
            alert.addAction(cancel)
            alert.view.layoutIfNeeded() //avoid Snapshotting error
            present(alert, animated: true, completion: nil)
        }
    }
}

