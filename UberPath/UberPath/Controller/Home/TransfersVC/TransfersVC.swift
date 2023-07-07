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
    var selectedRecipientIndexPath: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateTxtFld()
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        guard let selectedIndexPath = selectedRecipientIndexPath else {
            // Handle case when no recipient is selected
            return
        }
        
        let selectedUserImageName = recipientsCollectionViewArray[selectedIndexPath.row]
        if let cell = chooseRecipientsCollectionView.cellForItem(at: selectedIndexPath) as? ChooseRecipientsCell {
            let selectedUserName = cell.userNameLbl.text
            
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransferDetailVC") as! TransferDetailVC
            destinationVC.userImageName = selectedUserImageName
            destinationVC.userName = selectedUserName
            navigationController?.pushViewController(destinationVC, animated: true)
        }
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
            // Handle chooseCardsCollectionView selection
        } else if collectionView == chooseRecipientsCollectionView {
            if let selectedIndexPath = selectedRecipientIndexPath {
                // Deselect the previously selected cell
                if let selectedCell = collectionView.cellForItem(at: selectedIndexPath) as? ChooseRecipientsCell {
                    selectedCell.cellView.layer.borderWidth = 0.0
                    for subview in selectedCell.cellView.subviews {
                        if let tickImageView = subview as? UIImageView {
                            tickImageView.removeFromSuperview()
                        }
                    }
                }
            }
            
            // Select the newly selected cell
            if let cell = collectionView.cellForItem(at: indexPath) as? ChooseRecipientsCell {
                cell.cellView.layer.borderWidth = 2.0
                cell.cellView.layer.borderColor = UIColor.green.cgColor
                
                let tickImageView = UIImageView(image: UIImage(systemName: "checkmark"))
                tickImageView.tintColor = .green
                
                let padding: CGFloat = 5.0
                
                let originX = cell.cellView.bounds.width - tickImageView.bounds.width - padding
                let originY = padding
                
                tickImageView.frame = CGRect(x: originX, y: originY, width: tickImageView.bounds.width, height: tickImageView.bounds.height)
                cell.cellView.addSubview(tickImageView)
                
                selectedRecipientIndexPath = indexPath
            }
        }
    }
     
}


