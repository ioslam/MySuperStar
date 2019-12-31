//
//  URLs.swift
//  MySuperStar
//
//  Created by Eslam on 12/24/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import Foundation

class URLs {
    
    ///mark:- API_Key
    static let API_Key = "5d3fa758ba1c2690af9c4455aa75790e"
    
    ///mark:- Popular People URL, takes 3 parameters(API_Key, Language, Page)
    static let PopularPeopleURL = "https://api.themoviedb.org/3/person/popular?api_key=" + URLs.API_Key + "&language=en-US&page="
    
    ///mark:- Requesting image URL
    static let ImageRequestURL = "https://image.tmdb.org/t/p/w500"
    
    ///mark:- Base URL for People details
    static let DetailBaseURL = "https://api.themoviedb.org/3/person/"
    
    ///mark:- End URL for People details
    static let DetailEndURL = "?api_key=" + URLs.API_Key + "&language=en-US"
    
    ///mark:- Base URL to getting all movies of the person by person ID
    static let MovieCreditsBaseURL = "https://api.themoviedb.org/3/person/"
    
    ///mark:- End URL to getting all movies of the person by person ID
    static let MovieCreditsEndURL = "/movie_credits?api_key=" + URLs.API_Key + "&language=en-US"
    
    ///mark:- Base URL to get all crews by movie ID
    static let MovieCrewBaseURL = "https://api.themoviedb.org/3/movie/"
    
    ///mark:- End URL to get all crews by movie ID
    static let MovieCrewEndURL = "/credits?api_key=" + URLs.API_Key
    
    ///mark:- Base URL for person query search
    static let SearchQueryBaseURL = "https://api.themoviedb.org/3/search/person?api_key=" + URLs.API_Key + "&language=en-US&query="
    
    ///mark:- Middle URL for person query search
    static let SearchQueryMiddleURL = "&page="
    
    ///mark:- End URL for person query search
    static let SearchQueryEndURL = "&include_adult=false"

static func my_fun() {
    
}
}
