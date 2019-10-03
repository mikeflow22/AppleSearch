//
//  SearchResultsTableViewController.swift
//  AppleSearch
//
//  Created by Michael Flowers on 10/3/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    var musicSearchResults = [MusicSearchResult]()
    var appSearchResults = [AppSearchResult]()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmenedControlValueChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return segmentedControl.selectedSegmentIndex == 0 ? musicSearchResults.count : appSearchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunesCell", for: indexPath) as! ResultsTableViewCell

        // Configure the cell...
        
        if segmentedControl.selectedSegmentIndex == 0 {
            //music
            let item = musicSearchResults[indexPath.row]
            cell.musicItem = item
        } else if segmentedControl.selectedSegmentIndex == 1 {
            let item = appSearchResults[indexPath.row]
            cell.appItem = item
        }
        
        return cell
    }
   
}
