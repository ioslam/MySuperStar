//
//  SuperStarsCell.swift
//  MySuperStar
//
//  Created by Eslam on 12/24/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import UIKit

class SuperStarsCell: UICollectionViewCell {
    
    @IBOutlet weak var cell_view: UIView!
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var superstarsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    func setupView() {
        cell_view.layer.cornerRadius  = 5
        cell_view.layer.masksToBounds = true
        iv.clipsToBounds = true
        cell_view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //cell_view.layer.borderWidth   = 0
        //layer.shadowRadius  = 5
        //layer.shadowOpacity = 0.5
        //layer.shadowColor   = UIColor.black.cgColor
        //cell_view.layer.borderColor   = UIColor.gray.cgColor
        //clipsToBounds       = false
        //cell_view.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
    }
    
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
