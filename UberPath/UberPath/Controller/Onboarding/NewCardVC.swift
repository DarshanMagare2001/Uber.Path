//
//  NewCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

class NewCardVC: UIViewController {
    var selectedImageName : String?
    @IBOutlet weak var cardDetailLbl: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNumberTxtFld: UITextField!
    @IBOutlet weak var expiryDateTxtFld: UITextField!
    @IBOutlet weak var vccTxtFld: UITextField!
    @IBOutlet weak var cardHolderTxtFld: UITextField!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedImageName)
        updateFont()
        updatePlaceHolders()
        
    }
    
    
    @IBAction func countryShowBtnPressed(_ sender: UIButton) {
        
        
        
    }
    
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        cardDetailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
    }
    
    func updatePlaceHolders(){
        cardNumberTxtFld.placeholder = "Card number"
        expiryDateTxtFld.placeholder = "Expiry date"
        vccTxtFld.placeholder = "VCC"
        cardHolderTxtFld.placeholder = "Card holder"
    }
    
}
