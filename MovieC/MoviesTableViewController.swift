//
//  MoviesTableViewController.swift
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, UISearchBarDelegate {

    var arrayOfMovies: [JLMovie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 300
        //tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { arrayOfMovies = [] ; return }
        
        JLMovieController.shared().searchForMovies(withSearchTerm: searchText) { (arrayOfMovies, error) in
            
            if let error = error {
                print("Error \(#file) \(#function): \(error.localizedDescription)")
                return
            }
            
            self.arrayOfMovies = (arrayOfMovies as? [JLMovie]) ?? []
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMovies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = arrayOfMovies[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.movie = movie
        
        return cell
    }

}
