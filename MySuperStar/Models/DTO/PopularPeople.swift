// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var popularPeople = try? newJSONDecoder().decode(PopularPeople.self, from: jsonData)

import Foundation

// MARK: - PopularPeople
struct PopularPeople: Codable {
    var page, totalPages: Int
    var results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    var knownForDepartment,name ,profilePath: String?
    var  id: Int?
    var knownFor: [KnownFor]?
    
    enum CodingKeys: String, CodingKey {
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
        case knownFor = "known_for"
        case name
    }
}
// MARK: - KnownFor
struct KnownFor: Codable {
    var title: String?
    var id: Int?

}
