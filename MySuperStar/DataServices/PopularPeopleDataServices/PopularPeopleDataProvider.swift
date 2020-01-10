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
    
    class func getPopularPeople(page: Int = 1 ,completetion: @escaping (_ error: Error?,_ popularPeople: PopularPeople? , _ last_page: Int) -> () ){
        Alamofire.request(URLs.PopularPeopleURL + String(page)).responseJSON { (response) in
            do {
            let jsonDecoder = try JSONDecoder().decode(PopularPeople.self, from: response.data!)
                var lastPage = Int()
                
                if let totalPages = jsonDecoder.totalPages {
                    lastPage = totalPages
                }
                completetion(nil,jsonDecoder,lastPage)
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
    class func getMovieDetails(movie_id: Int, completetion: @escaping(_ error: Error?,_ movies: Movies?) ->()){
        let url = "https://api.themoviedb.org/3/movie/" + String(movie_id) + "?api_key=5d3fa758ba1c2690af9c4455aa75790e&language=en-US"
        Alamofire.request(url).responseJSON { (response) in
            do {
            let jsonDecoder = try JSONDecoder().decode(Movies.self, from: response.data!)
            completetion(nil,jsonDecoder)
            } catch {
                print("errrrror")
            }
        }
    }
    class func getCrewData(movie_id: Int, completation: @escaping (_ crew: MovieCrew?) -> ()){
       let url = "https://api.themoviedb.org/3/movie/" + String(movie_id) + "/credits?api_key=5d3fa758ba1c2690af9c4455aa75790e"
        Alamofire.request(url).responseData { (response) in
            do {
            let jsonDecoder = try JSONDecoder().decode(MovieCrew.self, from: response.data!)
                completation(jsonDecoder)
            } catch {
                print("error")
            }
        }
    }
    
    class func getQuery(page : Int = 1, name : String , complation: @escaping (_ searchQuery : SearchQuery , _ lastPage : Int)-> Void){
        
        let url = URLs.SearchQueryBaseURL + name + URLs.SearchQueryMiddleURL + String(page) + URLs.SearchQueryEndURL
        
        Alamofire.request(url).responseJSON { (response) in
            
            do{
                let JSONdecoder = try JSONDecoder().decode(SearchQuery.self , from: response.data!)
                
                var lastPage = Int()
                
                if let totalPages = JSONdecoder.total_pages{
                    lastPage = totalPages
                }
                
                complation(JSONdecoder, lastPage)
                
            }catch{
                print("error")
            }
        }
    }
}
