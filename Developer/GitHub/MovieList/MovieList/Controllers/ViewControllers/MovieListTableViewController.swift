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
        
        searchBar.delegate = self
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
        cell.updateViews(movie: movie)
        
        return cell
    }
}

// MARK: - Extensions
extension MovieListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        MovieController.fetchMoviesWith(searchTerm: searchTerm) { movies in
            guard let movies = movies else { return }
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
