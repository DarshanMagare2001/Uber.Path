//
//  ActivityVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class ActivityVC: UIViewController {
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var pageControllForCollectionViewOne: UIPageControl!
    var collectionViewOneArray = ["Co.payment Cards","Smartpay Cards"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        pageControllForCollectionViewOne.numberOfPages = collectionViewOneArray.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControllForCollectionViewOne.currentPage = Int(pageIndex)
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
           let page = sender.currentPage
           let indexPath = IndexPath(item: page, section: 0)
           collectionViewOne.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       }
    
}

extension ActivityVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewOneArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewOneCell", for: indexPath) as! CollectionViewOneCell
        cell.cellImg.image = UIImage(named : collectionViewOneArray[indexPath.row])
        return cell
    }
}
