//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var poster: UIImage? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    // MARK: - Functions
    func setConfiguration(with movie: Movie) {
        fetchPoster(forMovie: movie)
        var config = defaultContentConfiguration()
        config.text = movie.title
        config.secondaryText = movie.overview
        config.secondaryTextProperties.numberOfLines = 4
        config.imageProperties.maximumSize = CGSize(width: 50, height: 100)
        contentConfiguration = config
    }
    
    func fetchPoster(forMovie movie: Movie) {
        MovieController.fetchPoster(forMovie: movie) { poster in
            DispatchQueue.main.async {
                self.poster = poster
            }
        }
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        guard var config = contentConfiguration as? UIListContentConfiguration else { return }
        config.image = self.poster
        contentConfiguration = config
    }
}
