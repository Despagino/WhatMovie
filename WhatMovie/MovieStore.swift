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
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map({ URLQueryItem(name: $0.key, value: $0.value) })
                
            )
        }
        
        urlComponents.queryItems = queryItems
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL) { data, response, error in
            
            if error != nil {
                completion(.failure(.apiError))
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandler(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandler(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionHandler(with: .success(decodedResponse), completion: completion)
            } catch {
                self.executeCompletionHandler(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
        
    }
    
    private func executeCompletionHandler<D: Decodable>(with result: Result<D, MovieError>, completion: @escaping (Result<D, MovieError>) -> ()) {
        
        DispatchQueue.main.async {
            completion(result)
        }
        
    }
    
}
