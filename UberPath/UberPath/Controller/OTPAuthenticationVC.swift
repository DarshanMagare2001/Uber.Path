//
//  OTPAuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 26/06/23.
//

import UIKit
import FirebaseAuth
import ADCountryPicker

class OTPAuthenticationVC: UIViewController,ADCountryPickerDelegate {
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        countryPickerLbl.text = dialCode
        countryCode = dialCode
        
    }
    
    @IBOutlet weak var verifyLbl: UILabel!
    @IBOutlet weak var enterPhoneNumberLbl: UILabel!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var otpTxtFld1: UITextField!
    @IBOutlet weak var otpTxtFld2: UITextField!
    @IBOutlet weak var otpTxtFld3: UITextField!
    @IBOutlet weak var otpTxtFld4: UITextField!
    @IBOutlet weak var otpTxtFld5: UITextField!
    @IBOutlet weak var otpTxtFld6: UITextField!
    @IBOutlet weak var countryPickerLbl: UILabel!
    var verificationID: String?
    var countryCode : String = "+91"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(countryPickerLabelTapped))
        countryPickerLbl.isUserInteractionEnabled = true
        countryPickerLbl.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func sendCodeBtnPressed(_ sender: UIButton) {
        guard let phoneNumber = phoneNumberTxtFld.text else {
            showToast(message: "Please enter a phone number.")
            return
        }
        
        PhoneAuthProvider.provider().verifyPhoneNumber("\(countryCode)\(phoneNumber)", uiDelegate: nil) { [weak self] verificationID, error in
            if let error = error {
                // Handle verification error
                print("Verification error: \(error.localizedDescription)")
                return
            }
            
            // Verification code sent successfully
            self?.verificationID = verificationID
            self?.showToast(message: "Verification code sent to your phone number.")
        }
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        guard let verificationID = verificationID else {
            showToast(message: "Please request a verification code first.")
            return
        }
        
        let otp = "\(otpTxtFld1.text ?? "")\(otpTxtFld2.text ?? "")\(otpTxtFld3.text ?? "")\(otpTxtFld4.text ?? "")\(otpTxtFld5.text ?? "")\(otpTxtFld6.text ?? "")"
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: otp)
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if let error = error {
                // Handle sign-in error
                print("Sign-in error: \(error.localizedDescription)")
                self?.showToast(message: "Invalid verification code.")
                return
            }
            
            // Sign-in successful
            print("Sign-in successful with phone number: \(authResult?.user.phoneNumber ?? "")")
            self?.showToast(message: "Phone number verified successfully.")
            
            // Perform any additional operations after successful sign-in
            
            // Reset the OTP text fields
            self?.resetOTPTxtFlds()
        }
    }
    
    @IBAction func resendCodeBtnPressed(_ sender: UIButton) {
        // Reset the OTP text fields
        resetOTPTxtFlds()
        
        // Resend verification code
        sendCodeBtnPressed(sender)
    }
    
    
    
    @objc func countryPickerLabelTapped() {
        let picker = ADCountryPicker(style: .grouped)
        picker.delegate = self
        picker.showCallingCodes = true
        picker.showFlags = true
        picker.pickerTitle = "Select a Country"
        picker.defaultCountryCode = "US"
        picker.forceDefaultCountryCode = false
        picker.closeButtonTintColor = UIColor.black
        picker.font = UIFont(name: "Helvetica Neue", size: 15)
        picker.flagHeight = 40
        picker.hidesNavigationBarWhenPresentingSearch = true
        picker.searchBarBackgroundColor = UIColor.lightGray
        picker.didSelectCountryClosure = { [weak self] name, code in
            guard let self = self else { return }
            
            self.dismiss(animated: true, completion: nil)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            picker.modalPresentationStyle = .popover
            picker.popoverPresentationController?.sourceView = countryPickerLbl
            picker.popoverPresentationController?.sourceRect = countryPickerLbl.bounds
        } else {
            picker.modalPresentationStyle = .custom
            picker.transitioningDelegate = self
        }
        
        present(picker, animated: true, completion: nil)
    }
 
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func resetOTPTxtFlds() {
        otpTxtFld1.text = ""
        otpTxtFld2.text = ""
        otpTxtFld3.text = ""
        otpTxtFld4.text = ""
        otpTxtFld5.text = ""
        otpTxtFld6.text = ""
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
    
    
}

extension OTPAuthenticationVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomBottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
