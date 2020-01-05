//
//  CastVC.swift
//  MySuperStar
//
//  Created by Eslam on 1/2/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
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
            self.dispalyMovieImage(imageUrl: movies?.poster_path ?? "", iv: self.poster_iv!)
            self.dispalyMovieImage(imageUrl: self.cast?.backdrop_path ?? "", iv: self.back_iv!)

        }
    }
    func dispalyBackgroundImage(imageUrl: String) {
        let url = URL(string: URLs.ImageRequestURL + imageUrl)
        self.back_iv.kf.indicatorType = .activity
        self.back_iv.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
    }
    func dispalyMovieImage(imageUrl: String, iv : UIImageView) {
        let url = URL(string: URLs.ImageRequestURL + imageUrl)
        iv.kf.indicatorType = .activity
        iv.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
    }
    func dispalyData(movie: Movies) {
        movie_overview_txt.text = movie.overview ?? "No data"
        release_date_label.text = "Release(\(movie.release_date ?? "- - -"))"
        character_label.text = cast?.character ?? "title.."
    }
}
