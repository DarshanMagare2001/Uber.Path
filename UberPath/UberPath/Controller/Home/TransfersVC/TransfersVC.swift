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
    @IBOutlet weak var chooseCardsLbl: UILabel!
    @IBOutlet weak var chooseRecepientLbl: UILabel!
    var collectionViewOutletArray = ["CardStyleOne","CardStyleThree","CardStyleTwo"]
    var recipientsCollectionViewArray = ["Linda John","David William","Susan Charles"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        recipientsCollectionView.delegate = self
        recipientsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOutlet {
            return collectionViewOutletArray.count
        } else if collectionView == recipientsCollectionView {
            return recipientsCollectionViewArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOutlet {
            let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cardCollectionCell", for: indexPath) as!ChooseCardsCell
            cell.cellImage.image = UIImage(named: collectionViewOutletArray[indexPath.row])
            return cell
        } else if collectionView == recipientsCollectionView {
            let cell = recipientsCollectionView.dequeueReusableCell(withReuseIdentifier: "recipientsCollectionViewCell", for: indexPath) as! ChooseRecipientsCell
            cell.cellImage.image = UIImage(named: recipientsCollectionViewArray[indexPath.row])
            cell.cellLbl.text = recipientsCollectionViewArray[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func updateFont() {
        chooseCardsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        chooseRecepientLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        
    }
}

