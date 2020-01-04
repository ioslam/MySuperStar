//
//  CastVC.swift
//  MySuperStar
//
//  Created by Eslam on 1/2/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import UIKit

class CastVC: BaseVC {
    
    var movies: Movies?
    var cast: Cast?
  
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var back_iv: UIImageView!
    @IBOutlet weak var poster_iv: UIImageView!
    @IBOutlet weak var release_date_label: UILabel!
    @IBOutlet weak var movie_overview_txt: UITextView!
    @IBOutlet weak var character_label: UILabel!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func setupOutlets() {
        navBar.topItem?.title = self.cast?.title ?? "Unknown"
        fetchData()
    }
    func fetchData() {
        PopularPeopleDataProvider.getMovieDetails(movie_id: cast?.id ?? 122 ) { (error, movies) in
            self.movies = movies
            self.dispalyData(movie: movies!)

        }
    }
    func dispalyImage(imageUrl: String) {
        
        
    }
    func dispalyData(movie: Movies) {
        movie_overview_txt.text = movie.overview ?? "No data"
        release_date_label.text = "Release(\(movie.release_date ?? "- - -"))"
        character_label.text = cast?.character ?? "title.."
    }
}
