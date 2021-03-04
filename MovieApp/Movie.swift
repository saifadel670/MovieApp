//
//  Movie.swift
//  MovieApp
//
//  Created by saif adel on 2/3/21.
//


struct Result: Decodable {
    
    let posterPath: String
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Float
}
struct Movie: Decodable {
    let page: Int?
    let results: [Result]
    let totalPages, totalResults: Int

}
//typealias  Movie = MovieData
