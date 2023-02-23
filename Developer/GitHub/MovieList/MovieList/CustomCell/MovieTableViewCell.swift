//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: - Functions
    func setConfiguration(with movie: Movie) {
        // Note: - Fetch Image
        var config = defaultContentConfiguration()
        config.text = movie.title
        config.secondaryText = movie.overview
        config.secondaryTextProperties.numberOfLines = 4
        contentConfiguration = config
    }
}
