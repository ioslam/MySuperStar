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
    
    let cast: [Cast]?
    let id: Int?
}

// MARK: - Cast
struct Cast: Codable {
    var id: Int?
    var title: String?
    var poster_path: String?
    var character: String?
    var backdrop_path: String?
}

struct MovieCrew : Codable {
    
    var cast : [Crew]?
}

struct Crew : Codable {
    
    var name : String?
    var profile_path : String?
}

