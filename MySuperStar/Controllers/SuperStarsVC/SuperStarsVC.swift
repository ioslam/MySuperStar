//  Created by Eslam on 12/24/19.
//  Copyright © 2019 Eslam. All rights reserved.
//

import UIKit

class SuperStarsVC: BaseVC {
   
    var cell_ID = "superstarsCell"
    var results: [Result]? = []
    lazy var refresher : UIRefreshControl = { () -> UIRefreshControl in
        let ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(fetchDataResults), for: .valueChanged)
        return ref
    }()
    
    private var isloading = false
    private var currentPage = 1
    private var lastPage = 1
    
    @IBOutlet weak var superstarsCollectionView: UICollectionView!
    
    override func setupOutlets() {
        superstarsCollectionView.backgroundColor = .black
        superstarsCollectionView.delegate = self
        superstarsCollectionView.addSubview(refresher)
        superstarsCollectionView.dataSource = self
        superstarsCollectionView.register(UINib(nibName: "SuperStarsCell", bundle: nil), forCellWithReuseIdentifier: cell_ID)
        fetchDataResults()
    }
    
   @objc func fetchDataResults() {
        
 if Reachability.isConnectedToNetwork(){
                    DispatchQueue.main.async {
                        self.refresher.endRefreshing()
                    }
                    guard !isloading else {return}
                    isloading = true
    PopularPeopleDataProvider.getPopularPeople { (error,popularPeoples, lastPage) in
                        
                        self.results = popularPeoples?.results
                        self.isloading = false
                        self.superstarsCollectionView.reloadData()
                        self.currentPage = 1
                        self.lastPage = lastPage
                    }
                }else{
                    
                    let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "Ok", style: .cancel) { (UIAlertAction) in
                        print("No internet connection")
                    }
                    alert.addAction(cancel)
                    present(alert, animated: true, completion: nil)
                }
    }
    
    fileprivate func loadMore(){
        
        guard !isloading else {return}
        guard currentPage < lastPage else {return}
        isloading = true
        PopularPeopleDataProvider.getPopularPeople(page: currentPage+1) { (error, popularPeoples, lastPage) in
            
            for data in popularPeoples!.results {
                self.results?.append(data)
            }
            self.isloading = false
            self.superstarsCollectionView.reloadData()
            self.currentPage += 1
            self.lastPage = lastPage
        }
    }
      
} // End of Class SuperStars

extension SuperStarsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results?.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = superstarsCollectionView.dequeueReusableCell(withReuseIdentifier: cell_ID, for: indexPath) as! SuperStarsCell
        cell.superstarsLabel.text = results?[indexPath.row].name ?? "data"
        cell.displayImg(URLString: results?[indexPath.row].profilePath ?? "")
        var knownFor = ""
        for item in self.results?[indexPath.row].knownFor ?? []{
            knownFor += item.title ?? ""
            knownFor = knownFor + ", "
        }
        cell.knownForLabel.text = knownFor
        return cell
    }
} // End OF DataSource

extension SuperStarsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (superstarsCollectionView.frame.size.width - 30 ) / 2
        let height = CGFloat(230)
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let result = self.results![indexPath.row]
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let VC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        VC.results = result
       present(VC, animated: true, completion: nil)
    }
 func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let count = self.results?.count
        if indexPath.row == count!-1{
            //load more
            self.loadMore()
        }
    }
}
