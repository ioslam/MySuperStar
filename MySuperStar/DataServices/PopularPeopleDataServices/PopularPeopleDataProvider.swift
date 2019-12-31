//
//  PopularPeopleData.swift
//  MySuperStar
//
//  Created by Eslam on 12/26/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import Foundation
import Alamofire

class PopularPeopleDataProvider {
    
    class func getPopularPeople(page: Int = 1 ,completetion: @escaping (_ error: Error?,_ popularPeople: PopularPeople? , _ last_page: Int?) -> () ){
        Alamofire.request(URLs.PopularPeopleURL).responseJSON { (response) in
            do {
            let jsonDecoder = try JSONDecoder().decode(PopularPeople.self, from: response.data!)
                completetion(nil,jsonDecoder,jsonDecoder.totalPages)
            } catch {
                print(error)
            }
        }
    }
    
    class func getPopularPeopleDetails(person_id: Int, completion: @escaping (_ error: Error?,_ details: Details?) -> ()) {
        let url = URLs.DetailBaseURL + String(person_id) + URLs.DetailEndURL
        Alamofire.request(url).responseJSON { (response) in
            do {
                let jsonDecoder = try JSONDecoder().decode(Details.self, from: response.data! )
                completion(nil, jsonDecoder )
            } catch {
                print(error)
                completion(error, nil )
            }
        }
    }
    class func getMovieCredits(person_id: Int , completion: @escaping (_ movieCredits: MovieCredits?)-> ()) {
        let url = URLs.MovieCreditsBaseURL + String(person_id) + URLs.MovieCreditsEndURL
        Alamofire.request(url).responseJSON { (movieCredits) in
            do {
                let jsonDecoder = try JSONDecoder().decode(MovieCredits.self, from: movieCredits.data!)
                completion(jsonDecoder)
            } catch {
            }
        }
    }
    
}
