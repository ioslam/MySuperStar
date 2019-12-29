//
//  DetailsVC.swift
//  MySuperStar
//
//  Created by Eslam on 12/27/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import Foundation
import UIKit

class DetailsVC: BaseVC {
    // Declare vars
    let cell_ID = "detailsCell"
    var results: Result?
    // set UIoutlet
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var biograghy_label: UILabel!
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var gender_label: UILabel!
    @IBOutlet weak var birthday_label: UILabel!
    @IBOutlet weak var placeOfBirth_label: UILabel!
    @IBOutlet weak var relatedMoviesCollectionView: UICollectionView!
    // Button Pressed
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func seeMorePressed(_ sender: Any) {
        
    }
    // Main Method
    override func setupOutlets() {
        
        relatedMoviesCollectionView.delegate = self
        relatedMoviesCollectionView.dataSource = self
        relatedMoviesCollectionView.register(UINib(nibName: "DetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "detailsCell")
    }
    
} // End of Class

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell_ID, for: indexPath) as? DetailsCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
extension DetailsVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let height = CGFloat(157)
           return CGSize(width: 120, height: height)
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let VC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
          present(VC, animated: true, completion: nil)
       }
}
