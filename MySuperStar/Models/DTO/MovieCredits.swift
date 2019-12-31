//
//  MovieCredits.swift
//  MySuperStar
//
//  Created by lodex solutions on 12/30/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import Foundation

// MARK: - MovieCredits
struct MovieCredits: Codable {
    let cast: [Cast]
    let id: Int
}

// MARK: - Cast
struct Cast: Codable {
    let id: Int
    let title: String
    let poster_path: String?
//    let character: String?
//    let credit_id: String
//    let video: Bool
//    let vote_count: Int
//    let adult: Bool
//    let backdrop_path: String?
//    let genre_ids: [Int]
//    let original_language: OriginalLanguage
//    let original_title: String
//    let popularity: Double
//    let vote_average: Double
//    let overview, release_date: String
//    let department: Department?
//    let job: String?
}

//enum Department: String, Codable {
//    case directing = "Directing"
//    case production = "Production"
//    case writing = "Writing"
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case pt = "pt"
//}
