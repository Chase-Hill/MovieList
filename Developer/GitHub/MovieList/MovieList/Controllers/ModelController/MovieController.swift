//
//  MovieController.swift
//  MovieList
//
//  Created by Chase on 2/23/23.
//

import Foundation

class MovieController {
    
    static func fetchMoviesWith(searchTerm: String, completion: @escaping ([Movie]?) -> Void) {
        
        // MARK: - Construct URL
        
        guard let baseURL = URL(string: Constants.MovieURL.baseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiKeyQuery = URLQueryItem(name: Constants.MovieURL.apiKeyKey, value: Constants.MovieURL.apiKeyValue)
        let searchQuery = URLQueryItem(name: Constants.MovieURL.movieQueryKey, value: searchTerm)
        
        guard let finalURL = urlComponents?.url else { completion(nil) ; return }
        print("Final Movie URL: \(finalURL)")
        
        // MARK: - Fetch data with url
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Movie Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(nil) ; return }
            
            do {
                
                let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]
                
                guard let movieArray = topLevel?["results"] as? [[String : Any]] else { completion(nil) ; return }
                
                ///$0 == the current element the compactMap closure is about to transform
                let movies = movieArray.compactMap { Movie(dictionary: $0) }
                completion(movies)
                
            } catch {
                
                print(error.localizedDescription)
                completion(nil) ; return
            }
        } .resume()
    }
}
