//
//  MovieStore.swift
//  WhatMovie
//
//  Created by Gino Tasis on 3/25/22.
//

import Foundation

class MovieStore: MovieService {
    
    static let shared = MovieStore()
    private init() {}
    
    private let apiKey = "1a326e6f4f3b3cee865c27b54d44b22f"
    private let baseURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder

    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
         
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        
    }
    
    func searchMovies(query: String, completion: @escaping (Result<MovieListEndpoint, MovieError>) -> ()) {
        
    }
    
    private func loadURLDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, MovieError>) -> ()) {

        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        
        
    }
    
    
    
}
