//
//  ResetYourPasswordVC.swift
//  UberPath
//
//  Created by IPS-161 on 27/06/23.
//

import UIKit

class ResetYourPasswordVC: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var createNewPasswordLbl: UILabel!
    @IBOutlet weak var pleaseEnterPassword: UILabel!
    @IBOutlet weak var newPasswordTxtFld: UITextField!
    @IBOutlet weak var newPasswordTxtFldBtn: UIButton!
    @IBOutlet weak var confirmNewPasswordTxtFld: UITextField!
    @IBOutlet weak var confirmNewPasswordTxtFldBtn: UIButton!
    var isShowNewPasswordTxtFld = false
    var isShowConfirmNewPasswordTxtFld = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        newPasswordTxtFld.delegate = self
        confirmNewPasswordTxtFld.delegate = self
        
    }
    
    @IBAction func createNewPasswordBtnPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func newPasswordTxtFldBtnPressed(_ sender: UIButton) {
        isShowNewPasswordTxtFld.toggle()
        if isShowNewPasswordTxtFld {
            let image = UIImage(systemName: "eye")
            newPasswordTxtFldBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            newPasswordTxtFldBtn.setImage(image, for: .normal)
        }
        newPasswordTxtFld.isSecureTextEntry.toggle()
        
    }
    
    @IBAction func confirmNewPasswordTxtFldBtnPressed(_ sender: UIButton) {
        
        isShowConfirmNewPasswordTxtFld.toggle()
        if isShowConfirmNewPasswordTxtFld {
            let image = UIImage(systemName: "eye")
            confirmNewPasswordTxtFldBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            confirmNewPasswordTxtFldBtn.setImage(image, for: .normal)
        }
        confirmNewPasswordTxtFld.isSecureTextEntry.toggle()
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    func updateFont() {
        createNewPasswordLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        pleaseEnterPassword.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the return button is tapped
        textField.resignFirstResponder()
        return true
    }
    
    
}
