//
//  Movie.swift
//  MovieApp
//
//  Created by saif adel on 2/3/21.
//

import Foundation

struct Result: Decodable {
    
    let poster_path: String
    let adult: Bool
    let overview: String
    let release_date: String
    let genre_ids: [Int]
    let id: Int
    let original_title: String
    let original_language: String
    let title: String
    let backdrop_path: String
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let vote_average: Float
}
struct MovieData: Decodable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

}
typealias  Movie = [MovieData]
