// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let popularPeople = try? newJSONDecoder().decode(PopularPeople.self, from: jsonData)

import Foundation

// MARK: - PopularPeople
struct PopularPeople: Codable {
    let page, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let popularity: Double
    let knownForDepartment: String
    let gender, id: Int
    let profilePath: String
    let adult: Bool
    let knownFor: [KnownFor]

    enum CodingKeys: String, CodingKey {
        case popularity
        case knownForDepartment = "known_for_department"
        case gender, id
        case profilePath = "profile_path"
        case adult
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let originalName: String
    let voteCount: Int
    let posterPath, mediaType, name: String
    let voteAverage: Double
    let id: Int
    let firstAirDate, originalLanguage: String
    let genreIDS: [Int]
    let backdropPath, overview: String
    let originCountry: [String]

    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case name
        case voteAverage = "vote_average"
        case id
        case firstAirDate = "first_air_date"
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case overview
        case originCountry = "origin_country"
    }
}
