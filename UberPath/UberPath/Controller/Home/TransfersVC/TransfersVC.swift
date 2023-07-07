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
    @IBOutlet weak var searchContactsTxtFlad: UITextField!
    var collectionViewOutletArray = ["CardStyleOne", "CardStyleThree", "CardStyleTwo"]
    var recipientsCollectionViewArray = ["Linda John", "David William", "Susan Charles"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateTxtFld()
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransferDetailVC") as! TransferDetailVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont(){
        chooseCardsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        chooseUserLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    func updateTxtFld() {
        searchContactsTxtFlad.placeholder = "Search contacts..."
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
            cell.userImageView.image = UIImage(named:recipientsCollectionViewArray[indexPath.row])
            cell.userNameLbl.text = recipientsCollectionViewArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == chooseCardsCollectionView {
            print("chooseCardsCollectionView")
            
            if let cell = collectionView.cellForItem(at: indexPath) as? ChooseCardsCell {
                cell.isSelected = !cell.isSelected
            }
        } else if collectionView == chooseRecipientsCollectionView {
            print("chooseRecipientsCollectionView")
        }
    }
}


