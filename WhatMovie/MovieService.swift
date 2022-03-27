//
//  MovieService.swift
//  WhatMovie
//
//  Created by Gino Tasis on 3/25/22.
//

import Foundation

protocol MovieService {
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    
    func fetchMovie(id: Int,  completion: @escaping (Result<Movie, MovieError>) -> ())
    
    func searchMovies(query: String, completion: @escaping(Result<MovieListEndpoint, MovieError>) -> ())
    
    
}


enum MovieListEndpoint: String, CaseIterable {
    
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case.popular: return "Popular"
            
        }
    }
}


enum MovieError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    
    var localizedDescription: String {
        
        switch self {
        
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid Endpoint"
        case .invalidResponse: return "Invalid Response"
        case .noData: return "No data"
        case .serializationError: return "Failed to Decode data"
            
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
