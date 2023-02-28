//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!

    // MARK: - Fucntions
    func updateViews(movie: Movie) {
        
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = String(movie.rating)
        movieOverviewLabel.text = movie.overview
        fetchPoster(forMovie: movie)
    }
    
    func fetchPoster(forMovie movie: Movie) {
        MovieController.fetchPoster(forMovie: movie) { poster in
            DispatchQueue.main.async {
                self.posterImageView.image = poster
            }
        }
    }
}
