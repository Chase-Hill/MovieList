//
//  Movie.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import Foundation

class Movie {
    
    let title: String
    let overview: String
    let posterPath: String
    let rating: Double
    
    init(title: String, overview: String, posterPath: String, rating: Double) {
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.rating = rating
    }
}

extension Movie {
    
    enum Keys: String {
        case title = "original_title"
        case overview
        case imagePath = "poster_path"
        case rating = "vote_average"
    }
    
    convenience init?(dictionary: [String : Any]) {
        
        guard let title = dictionary[Keys.title.rawValue] as? String,
              let overview = dictionary[Keys.overview.rawValue] as? String,
              let posterPath = dictionary[Keys.imagePath.rawValue] as? String,
              let rating = dictionary[Keys.rating.rawValue] as? Double else {
            print("You're A Failure At Exactly: \(#file)\(#line)")
            return nil
        }
        
        self.init(title: title, overview: overview, posterPath: posterPath, rating: rating)
    }
}
