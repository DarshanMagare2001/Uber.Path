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
    var collectionViewOneArray = ["Co.payment Cards", "Smartpay Cards"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let page = sender.currentPage
        let offsetX = CGFloat(page) * collectionViewOne.frame.width
        let offset = CGPoint(x: offsetX, y: 0)
        collectionViewOne.setContentOffset(offset, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControllForCollectionViewOne.currentPage = currentPage
    }
    
    func updateCell(){
        pageControllForCollectionViewOne.numberOfPages = collectionViewOneArray.count
        let layout = UICollectionViewFlowLayout()
        let cellWidth = collectionViewOne.frame.width - 40 // Adjust the width as per your requirement
        layout.itemSize = CGSize(width: cellWidth, height: collectionViewOne.frame.height)
        layout.minimumLineSpacing = 40 // Adjust the spacing as per your requirement
        let horizontalInset = (collectionViewOne.frame.width - cellWidth) / 2
        layout.sectionInset = UIEdgeInsets(top: 20, left: horizontalInset, bottom: 20, right: horizontalInset) // Adjust the insets as per your requirement
        layout.scrollDirection = .horizontal
        collectionViewOne.collectionViewLayout = layout
    }
}

extension ActivityVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewOneArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewOneCell", for: indexPath) as! CollectionViewOneCell
        cell.cellImg.image = UIImage(named: collectionViewOneArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width - 40 // Adjust the width as per your requirement
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
    
}
