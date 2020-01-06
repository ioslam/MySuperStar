//
//  CastCollectionViewCell.swift
//  MySuperStar
//
//  Created by Eslam on 1/5/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cell_view: UIView!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var actor_name_label: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            setupView()
        }
        func setupView() {
            cell_view.layer.cornerRadius  = 5
            cell_view.layer.masksToBounds = true
            iv.clipsToBounds = true
        }
        func displayImg(URLString : String){
            
            let url = URL(string: URLs.ImageRequestURL + URLString)
            self.iv.kf.indicatorType = .activity
            self.iv.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(ImageTransition.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        }
    }
