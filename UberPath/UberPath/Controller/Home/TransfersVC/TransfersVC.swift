//
//  TransfersVC.swift
//  UberPath
//
//  Created by IPS-161 on 07/07/23.
//

import UIKit

class TransfersVC: UIViewController {
    @IBOutlet weak var chooseCardsCollectionView: UICollectionView!
    @IBOutlet weak var chooseRecipientsCollectionView: UICollectionView!
    @IBOutlet weak var chooseCardsLbl: UILabel!
    @IBOutlet weak var chooseUserLbl: UILabel!
    var collectionViewOutletArray = ["CardStyleOne", "CardStyleThree", "CardStyleTwo"]
    var recipientsCollectionViewArray = ["Linda John", "David William", "Susan Charles"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont(){
        chooseCardsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        chooseUserLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
}

extension TransfersVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == chooseCardsCollectionView {
            return collectionViewOutletArray.count
        } else if collectionView == chooseRecipientsCollectionView {
            return recipientsCollectionViewArray.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == chooseCardsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseCardsCollectionViewCell", for: indexPath) as! ChooseCardsCell
            cell.cellImage.image = UIImage(named:collectionViewOutletArray[indexPath.row] )
            return cell
            
        } else if collectionView == chooseRecipientsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseRecipientsCollectionViewCell", for: indexPath) as! ChooseRecipientsCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == chooseCardsCollectionView {
            print("chooseCardsCollectionView")
            
        } else if collectionView == chooseRecipientsCollectionView {
            print("chooseRecipientsCollectionView")
        }
    }
    
    
}
