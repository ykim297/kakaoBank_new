//
//  resultTableViewController.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit


class ResultTableViewController: UITableViewController {
        
    var filteredWords: [String] = []
    var searchResultList: [SearchResultModel] = []
    var isShowResult: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44;        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.keyboardDismissMode = .onDrag
        tableView.allowsSelection = true
                
        let filter = UINib(nibName: "FilterWordTableViewCell", bundle: nil)
        self.tableView.register(filter, forCellReuseIdentifier: "FilterWordTableViewCell")

        tableView.register(cellType: SearchResultTableViewCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.isShowResult {
            return self.searchResultList.count
        } else {
            return filteredWords.count
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if self.isShowResult {
            let cell = tableView.dequeueReusableCell(for: indexPath,
                                                        cellType: SearchResultTableViewCell.self)
            if searchResultList.count != 0 {
                cell.setData(dic: searchResultList[indexPath.row])
            }
            
            cell.selectionStyle = .none
            return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FilterWordTableViewCell",
                                                        for: indexPath) as? FilterWordTableViewCell {
                cell.resultLabel.text = filteredWords[indexPath.row]
                cell.selectionStyle = .none
                return cell
            }
        }
        
        return UITableViewCell()
    }

   
}


extension ResultTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        self.isShowResult = false
        if !self.searchResultList.isEmpty { self.searchResultList.removeAll()}
        let list = AppManager.shared.getRecentSearchWordList()
        filteredWords = list.filter { (list: String) -> Bool in
            if searchText.isEmpty {
                return false
            }
            else {
                return list.lowercased().contains(searchText.lowercased())
            }
        }
        self.tableView.reloadData()
    }
}

extension ResultTableViewController: UISearchBarDelegate {
}
