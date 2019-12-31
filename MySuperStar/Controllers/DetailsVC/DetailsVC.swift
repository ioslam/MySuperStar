//
//  DetailsVC.swift
//  MySuperStar
//
//  Created by Eslam on 12/27/19.
//  Copyright © 2019 Eslam. All rights reserved.

import Kingfisher
import UIKit

class DetailsVC: BaseVC {
    // Declare vars
    let cell_ID = "detailsCell"
    var results: Result?
    var details: Details?
    var movieCredits: MovieCredits?
    
    // set UIoutlet
    // Popup IBOutlets
    @IBOutlet weak var popUpHeight: NSLayoutConstraint!
    @IBOutlet weak var popupVeiw: UIView!
    @IBOutlet weak var PopupConst: NSLayoutConstraint!
    @IBOutlet weak var popTextField: UITextView!
    
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var biograghy_label: UILabel!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var gender_label: UILabel!
    @IBOutlet weak var birthday_label: UILabel!
    @IBOutlet weak var placeOfBirth_label: UILabel!
    @IBOutlet weak var relatedMoviesCollectionView: UICollectionView!
    
    // Buttons Pressed
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func seeMorePressed(_ sender: Any) {
       popupViewDispaly()
    }
    @IBAction func closePopupPressed(_ sender: Any) {
        PopupConst.constant = -500
        superView.alpha = 1

    }
    
    // Main Method
    override func setupOutlets() {
        
        relatedMoviesCollectionView.delegate = self
        relatedMoviesCollectionView.dataSource = self
        relatedMoviesCollectionView.register(UINib(nibName: "DetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "detailsCell")
        navBar.topItem?.title = results?.name ?? "Unknown"
        fetchData()
    }
    
    func fetchData() {
        
        PopularPeopleDataProvider.getPopularPeopleDetails(person_id: results?.id ?? 5) { (error, details) in
            self.details = details
            self.dispalyImage(imageUrl: details?.profile_path ?? "150")
            self.dispalyData(details: details)
        }
    }
    
    func dispalyData(details: Details?) {
        
        name_label.text = details?.name ?? "Unknown"
        birthday_label.text = details?.birthday ?? "Unavailable"
        biograghy_label.text = details?.biography ?? "No data Available"
        placeOfBirth_label.text = details?.place_of_birth ?? "--"
        if details?.gender == 2 {
            gender_label.text = "Male"
        } else {
            gender_label.text = "Female"
        }
        if details?.biography?.isEmpty == true {
            popTextField.text = "No data Available"
            biograghy_label.text = "No data Available"
        } else {
            popTextField.text = details?.biography
            biograghy_label.text = details?.biography
        }
        displayMovies()
    }
    
    func dispalyImage(imageUrl: String) {
        let url = URL(string: URLs.ImageRequestURL + imageUrl)
        self.iv.kf.indicatorType = .activity
        self.iv.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
    }
    
    func displayMovies() {
        PopularPeopleDataProvider.getMovieCredits(person_id: results?.id ?? 5) { (movie_Credits) in
            self.movieCredits = movie_Credits
            self.relatedMoviesCollectionView.reloadData()

        }
    }
    
    func popupViewDispaly() {
       
        popupVeiw.layer.cornerRadius = 6
        popUpHeight.constant = view.frame.size.height - (200)
        //let  x = view.frame.size.height - popupVeiw.frame.size.height
        PopupConst.constant = 100
        superView.alpha = 0.5
    }
} // End of Class

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieCredits?.cast.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_ID, for: indexPath) as? DetailsCollectionViewCell else { return UICollectionViewCell() }
        cell.displayImg(URLString: movieCredits?.cast[indexPath.row].poster_path ?? "")
        return cell
    }
}

extension DetailsVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let height = CGFloat(157)
           return CGSize(width: 118, height: height)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 2)
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let VC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
          present(VC, animated: true, completion: nil)
       }
}
