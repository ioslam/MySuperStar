//
//  Movies.swift
//  MySuperStar
//
//  Created by Eslam on 1/2/20.
//  Copyright © 2020 Eslam. All rights reserved.
//


import Foundation

// MARK: - Movie
struct Movies: Codable {
    let budget: Int?
    let homepage: String?
    let id: Int?
    let imdb_id, original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let belongs_to_collection: BelongsToCollection?
    let release_date: String?
    let revenue, runtime: Int?
    let status, title: String?

}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int
    let name, poster_path, backdrop_path: String
}




