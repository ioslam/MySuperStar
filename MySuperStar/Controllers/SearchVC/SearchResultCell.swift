//
//  SearchResultCell.swift
//  MySuperStar
//
//  Created by lodex solutions on 1/6/20.
//  Copyright © 2020 Eslam. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    @IBOutlet weak var name_label: UILabel!
    
    @IBOutlet weak var iv: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        name_label.isEnabled = selected
        if selected {
            name_label.becomeFirstResponder()
        } else {
            name_label.resignFirstResponder()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iv.layer.borderWidth = 1
        iv.layer.masksToBounds = false
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.cornerRadius = iv.frame.height/2
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
    }
    
    func displayImg(URLString : String){
        
        let url = URL(string: URLs.ImageRequestURL + URLString)
        self.iv.kf.indicatorType = .activity
        self.iv.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
