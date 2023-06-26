//
//  AuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 23/06/23.
//

import UIKit
import GoogleSignIn

class AuthenticationVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var hiThereLbl: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var signInEmailTxtFld: UITextField!
    @IBOutlet weak var signInPasswordTxtFld: UITextField!
    @IBOutlet weak var passwordShowHiddenBtn: UIButton!
    @IBOutlet weak var signUpNameTxtFld: UITextField!
    @IBOutlet weak var signUpEmailTxtFld: UITextField!
    @IBOutlet weak var signUpPasswordTxtFld: UITextField!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var createLbl: UILabel!
    @IBOutlet weak var copaymentLbl: UILabel!
    @IBOutlet weak var accontLbl: UILabel!
    
    var isPasswordShow = false
    var viewModel = AuthenticationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.isHidden = false
        signUpView.isHidden = true
        signInEmailTxtFld.delegate = self
        signInPasswordTxtFld.delegate = self
        signUpNameTxtFld.delegate = self
        signUpEmailTxtFld.delegate = self
        signUpPasswordTxtFld.delegate = self
        updateFont()
        updatePlaceHolders()
        
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
        signInPasswordTxtFld.isSecureTextEntry.toggle()
        signUpPasswordTxtFld.isSecureTextEntry.toggle()
    }
    
    
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        guard let email = signInEmailTxtFld.text, let password = signInPasswordTxtFld.text, !email.isEmpty, !password.isEmpty else {
            showToast(message: "Please fill all information.")
            return
        }
        
        viewModel.signIn(email: email, password: password)
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let name = signUpNameTxtFld.text, let email = signUpEmailTxtFld.text, let password = signUpPasswordTxtFld.text,
              !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                  showToast(message: "Please fill all information.")
                  return
              }
        
        viewModel.signUp(name: name, email: email, password: password)
    }
    
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let toastWidth: CGFloat = 200.0
        let toastHeight: CGFloat = 40.0
        let toastX = self.view.frame.size.width / 2 - toastWidth / 2
        let toastY = self.view.frame.size.height - 100.0
        
        toastLabel.frame = CGRect(x: toastX, y: toastY, width: toastWidth, height: toastHeight)
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func signInWithAppleBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func goTosignUpBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: {
            self.signInView.isHidden = true
            self.signUpView.isHidden = false
        }, completion: nil)
    }
    
    @IBAction func goTosignInBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: {
            self.signInView.isHidden = false
            self.signUpView.isHidden = true
        }, completion: nil)
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the return button is tapped
        textField.resignFirstResponder()
        return true
    }
    
    func updatePlaceHolders(){
        signInEmailTxtFld.placeholder = "Email"
        signInPasswordTxtFld.placeholder = "Password"
        signUpNameTxtFld.placeholder = "Full name"
        signUpEmailTxtFld.placeholder = "Email"
        signUpPasswordTxtFld.placeholder = "Password"
        
    }
    
}
