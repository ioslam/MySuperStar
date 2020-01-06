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
    let character: String?
    let backdrop_path: String?
//    let credit_id: String
//    let video: Bool
//    let vote_count: Int
//    let adult: Bool
//    let genre_ids: [Int]
}

// MARK: - MovieCrew
struct MovieCrew: Codable {
    let id: Int?
    let crew: [Crew]?
}

// MARK: - Cast
//struct Crews: Codable {
//    let castID: Int
//    let character, creditID: String
//    let gender, id: Int
//    let name: String
//    let order: Int
//    let profilePath: String?
//
//    enum CodingKeys: String, CodingKey {
//        case castID = "cast_id"
//        case character
//        case creditID = "credit_id"
//        case gender, id, name, order
//        case profilePath = "profile_path"
//    }
//}

// MARK: - Crew
struct Crew: Codable {
    let name: String?
    let profile_path: String?
}
