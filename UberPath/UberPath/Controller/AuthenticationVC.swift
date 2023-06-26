//
//  AuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 23/06/23.
//

import UIKit

class AuthenticationVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var hiThereLbl: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var passwordShowHiddenBtn: UIButton!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var createLbl: UILabel!
    @IBOutlet weak var copaymentLbl: UILabel!
    @IBOutlet weak var accontLbl: UILabel!
    
    var isPasswordShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.isHidden = false
        signUpView.isHidden = true
        updateFont()
        emailTxtFld.delegate = self
        passwordTxtFld.delegate = self
    }
    
    @IBAction func backArrowBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateFont(){
        hiThereLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        welcomeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        
        createLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        
        copaymentLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        
        accontLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
    }
    
    @IBAction func passwordHideShowBtnPressed(_ sender: UIButton) {
        isPasswordShow.toggle()
        if isPasswordShow {
            let image = UIImage(systemName: "eye")
            passwordShowHiddenBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            passwordShowHiddenBtn.setImage(image, for: .normal)
        }
        passwordTxtFld.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func signInWithAppleBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func goTosignUpBtnPressed(_ sender: UIButton) {
        signInView.isHidden = true
        signUpView.isHidden = false
        
    }
    
    
    @IBAction func goTosignInBtnPressed(_ sender: UIButton) {
        signInView.isHidden = false
        signUpView.isHidden = true
        
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the return button is tapped
        textField.resignFirstResponder()
        return true
    }
    
    
}
