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
    
    class func getPopularPeople(completetion: @escaping (_ error: Error?,_ popularPeople: PopularPeople?) -> () ){
        
        Alamofire.request(URLs.PopularPeopleURL).responseJSON { (response) in
            do {
            let jsonDecoder = try JSONDecoder().decode(PopularPeople.self, from: response.data!)
                    completetion(nil,jsonDecoder)
            } catch {
                print(error)
            }
        }
    }
}
