//
//  Movie.swift
//  WhatMovie
//
//  Created by Gino Tasis on 3/25/22.
//

import Foundation


struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    
    let id: Int
    let title: String
    let backdrop_path: String?
    let poster_path: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    
}
