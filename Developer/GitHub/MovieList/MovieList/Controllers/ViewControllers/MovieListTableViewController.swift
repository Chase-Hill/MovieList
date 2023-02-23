//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Actions
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }

        let movie = movies[indexPath.row]
        cell.setConfiguration(with: movie)

        return cell
    }
}
