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
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if isAllFieldsFilled() {
            saveDataToUserDefaults()
        } else {
            showAlert(message: "Please fill in all information.")
        }
    }
    
    func isAllFieldsFilled() -> Bool {
        return !(yourNameTxtFld.text?.isEmpty ?? true) &&
        !(OccupationTxtFld.text?.isEmpty ?? true) &&
        !(employerTxtFld.text?.isEmpty ?? true) &&
        !(phoneNumberTxtFld.text?.isEmpty ?? true) &&
        !(emailTxtFld.text?.isEmpty ?? true)
    }
    
    func saveDataToUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.setValue(yourNameTxtFld.text, forKey: "yourName")
        defaults.setValue(OccupationTxtFld.text, forKey: "occupation")
        defaults.setValue(employerTxtFld.text, forKey: "employer")
        defaults.setValue(phoneNumberTxtFld.text, forKey: "phoneNumber")
        defaults.setValue(emailTxtFld.text, forKey: "email")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Incomplete Information", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateFont() {
        yourNameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        OccupationLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        employerLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        phoneNumberLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        emailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
    }
    
    func updateTxtFlds(){
        let defaults = UserDefaults.standard
        if let yourName = defaults.string(forKey: "yourName") {
            yourNameTxtFld.placeholder = yourName
        }
        if let occupation = defaults.string(forKey: "occupation") {
            OccupationTxtFld.placeholder = occupation
        }
        if let employer = defaults.string(forKey: "employer") {
            employerTxtFld.placeholder = employer
        }
        if let phoneNumber = defaults.string(forKey: "phoneNumber") {
            phoneNumberTxtFld.placeholder = phoneNumber
        }
        if let email = defaults.string(forKey: "email") {
            emailTxtFld.placeholder = email
        }else{
            yourNameTxtFld.placeholder = "Darshan Magare"
            OccupationTxtFld.placeholder = "Manager"
            employerTxtFld.placeholder = "Overlay Design"
            phoneNumberTxtFld.placeholder = "(1) 3256 8456 888"
            emailTxtFld.placeholder = "darshan@gmail.com"
        }
        phoneNumberTxtFld.keyboardType = .numberPad
    }
    
}
