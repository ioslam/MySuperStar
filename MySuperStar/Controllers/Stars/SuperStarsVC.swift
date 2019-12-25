//  Created by Eslam on 12/24/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import UIKit

class SuperStarsVC: BaseVC {
   
    var cell_ID = "superstarsCell"
    
    @IBOutlet weak var superstarsCollectionView: UICollectionView!

    override func setupOutlets() {
        superstarsCollectionView.backgroundColor = .black
        superstarsCollectionView.bounces = false
        superstarsCollectionView.delegate = self
        superstarsCollectionView.dataSource = self
        superstarsCollectionView.register(UINib(nibName: "SuperStarsCell", bundle: nil), forCellWithReuseIdentifier: cell_ID)
    }

    
} // End of Class SuperStars

extension SuperStarsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = superstarsCollectionView.dequeueReusableCell(withReuseIdentifier: cell_ID, for: indexPath) as! SuperStarsCell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (superstarsCollectionView.frame.size.width - 30 ) / 2
        print(width)
        let height = CGFloat(230)
        return CGSize(width: width, height: height)
    }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
}
    
