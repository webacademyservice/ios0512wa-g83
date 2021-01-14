//
//  MainTableViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/13/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let watches = [
        Watch(name: "DAAD Classic", type: .classicWatch),
        Watch(name: "DAAD Hybrid", type: .hybridWatch),
        Watch(name: "DAAD Waterproof", type: .waterproofWatch),
    ]
    
    private var filteredWatches = [Watch]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard  let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredWatches.count
        }
        return watches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var watch: Watch
        
        if isFiltering {
            watch = filteredWatches[indexPath.row]
        } else {
            watch = watches[indexPath.row]
        }
        

        cell.textLabel?.text = watch.name
        cell.detailTextLabel?.text = watch.type.rawValue

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let watch: Watch
                if isFiltering {
                    watch = filteredWatches[indexPath.row]
                } else {
                    watch = watches[indexPath.row]
                }
                
                let detailVC = segue.destination as! DetailViewController
                detailVC.watch = watch
            }
        }
    }

}
extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    private func filterContentForSearchText(  searchText: String) {
        filteredWatches = watches.filter({ (watch: Watch) -> Bool in
            return watch.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
        
    }
}
