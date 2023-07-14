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
    @IBOutlet weak var btn1: UILabel!
    @IBOutlet weak var btn2: UILabel!
    @IBOutlet weak var btn3: UILabel!
    @IBOutlet weak var btn4: UILabel!
    var collectionViewOneArray = ["Co.payment Cards", "Smartpay Cards"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        updateCell()
        [btn1, btn2, btn3, btn4].enumerated().forEach { index, button in
            button?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(btnTapped(_:)))
            tapGesture.view?.tag = index
            button?.addGestureRecognizer(tapGesture)
        }
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let page = sender.currentPage
        let offsetX = CGFloat(page) * collectionViewOne.frame.width
        let offset = CGPoint(x: offsetX, y: 0)
        collectionViewOne.setContentOffset(offset, animated: true)
    }
    
 
    @objc func btnTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedLabel = gesture.view as? UILabel else {
            return
        }
        // Set the tapped label's background color to gray
        tappedLabel.backgroundColor = .systemGray6
        tappedLabel.font = UIFont.boldSystemFont(ofSize: tappedLabel.font.pointSize)
        // Set the background color of all other labels to white
        let allLabels = [btn1, btn2, btn3, btn4]
        for label in allLabels {
            if label != tappedLabel {
                label?.backgroundColor = .white
                label?.font = UIFont.systemFont(ofSize: (label?.font.pointSize)!)
                label?.layer.borderWidth = 0
                label?.layer.borderColor = UIColor.white.cgColor
                label?.layer.cornerRadius = 0
                label?.layer.shadowColor = UIColor.white.cgColor
                label?.layer.shadowOffset = CGSize(width: 0, height: 0)
                label?.layer.shadowRadius = 0
                label?.layer.shadowOpacity = 0
            }
        }
        // Add border and shadow to the tapped label
        tappedLabel.layer.borderWidth = 1.0
        tappedLabel.layer.borderColor = UIColor.gray.cgColor
        tappedLabel.layer.cornerRadius = 5.0
        tappedLabel.layer.shadowColor = UIColor.black.cgColor
        tappedLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        tappedLabel.layer.shadowRadius = 4.0
        tappedLabel.layer.shadowOpacity = 0.5
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
