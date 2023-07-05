//
//  TransfersVC.swift
//  UberPath
//
//  Created by IPS-161 on 04/07/23.
//

import UIKit

class TransfersVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var recipientsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        recipientsCollectionView.delegate = self
        recipientsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOutlet {
            return 3
        } else if collectionView == recipientsCollectionView {
            return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOutlet {
            let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cardCollectionCell", for: indexPath)
            return cell
        } else if collectionView == recipientsCollectionView {
            let cell = recipientsCollectionView.dequeueReusableCell(withReuseIdentifier: "recipientsCollectionViewCell", for: indexPath)
            return cell
        }
         
        return UICollectionViewCell()
    }
}

