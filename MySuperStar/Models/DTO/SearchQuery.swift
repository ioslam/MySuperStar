//
//  SearchQuery.swift
//  MySuperStar
//
//  Created by Eslam on 1/10/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation

struct SearchQuery : Codable {
    
    var page : Int?
    var total_pages : Int?
    var results : [SResult]?
}

struct SResult : Codable {
    
    var id : Int?
    var profile_path : String?
    var name : String?
}
