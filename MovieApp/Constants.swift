//
//  Constants.swift
//  MovieApp
//
//  Created by saif adel on 2/3/21.
//

import Foundation

struct Api {
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    static let endURL = "?api_key=ad29645ae17eaf42e832f46c206d5296"
    
    enum endpoint: String {
        case popular
        case top_rated
        //case 550
    }
}
