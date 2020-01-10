//
//  CastVC.swift
//  MySuperStar
//
//  Created by Eslam on 1/2/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
import Kingfisher

class CastVC: BaseVC {
    
    var movies: Movies?
    var cast: Cast?
    var crew: MovieCrew?
    var cellID = "castCell"
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var back_iv: UIImageView!
    @IBOutlet weak var poster_iv: UIImageView!
    @IBOutlet weak var release_date_label: UILabel!
    @IBOutlet weak var movie_overview_txt: UITextView!
    @IBOutlet weak var character_label: UILabel!
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func setupOutlets() {
        castCollectionView.register(UINib(nibName: "CastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        fetchData()
        navBar.topItem?.title = self.cast?.title ?? "Unknown"
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
    }
    
    func fetchData() {
        PopularPeopleDataProvider.getMovieDetails(movie_id: cast?.id ?? 5 ) { (error, movies) in
            self.movies = movies
            self.dispalyData(movie: movies!)
            self.dispalyMovieImage(imageUrl: movies?.poster_path ?? "", iv: self.poster_iv!)
            self.dispalyMovieImage(imageUrl: self.cast?.backdrop_path ?? "", iv: self.back_iv!)
        }
        PopularPeopleDataProvider.getCrewData(movie_id: cast?.id ?? 5) { (movieCrew) in
            self.crew = movieCrew
            self.castCollectionView.reloadData()
            //print(self.crew!)
            
        }
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
extension CastVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return crew?.cast?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CastCollectionViewCell else { return UICollectionViewCell() }
        cell.actor_name_label.text = self.crew?.cast?[indexPath.row].name ?? "Unknown"
        cell.displayImg(URLString: self.crew?.cast?[indexPath.row].profile_path ?? "placeholder")
        return cell
    }
        
}
extension CastVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = CGFloat(160)
        return CGSize(width: 118, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 2)
    }
}

