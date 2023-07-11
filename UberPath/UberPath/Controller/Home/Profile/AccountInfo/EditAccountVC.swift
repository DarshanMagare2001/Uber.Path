//
//  EditAccountVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class EditAccountVC: UIViewController {
    @IBOutlet weak var yourNameLbl: UILabel!
    @IBOutlet weak var OccupationLbl: UILabel!
    @IBOutlet weak var employerLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var yourNameTxtFld: UITextField!
    @IBOutlet weak var OccupationTxtFld: UITextField!
    @IBOutlet weak var employerTxtFld: UITextField!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateTxtFlds()
        
    }
    
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        yourNameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        OccupationLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        employerLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        phoneNumberLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        emailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
    }
    
    func updateTxtFlds(){
        yourNameTxtFld.placeholder = "Darshan Magare"
        OccupationTxtFld.placeholder = "Manager"
        employerTxtFld.placeholder = "Overlay Design"
        phoneNumberTxtFld.placeholder = "(1) 3256 8456 888"
        emailTxtFld.placeholder = "darshan@gmail.com"
        phoneNumberTxtFld.keyboardType = .numberPad
    }
    
}
