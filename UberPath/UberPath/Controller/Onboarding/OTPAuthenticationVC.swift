
import UIKit
import FirebaseAuth
import ADCountryPicker

//This is otp authentication class

class OTPAuthenticationVC: UIViewController, ADCountryPickerDelegate, UITextFieldDelegate, UIViewControllerTransitioningDelegate {

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
    var countryCode: String = "+91"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        tapGesture()
        allTxtFldConfiguration()
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
            self?.showToast(message: "Phone number verified successfully.") { [weak self] in
                // Reset the OTP text fields
                self?.resetOTPTxtFlds()
                
                // Perform any additional operations after successful sign-in
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let destinationVC = storyBoard.instantiateViewController(withIdentifier: "VerifyYourIdentityVC") as! VerifyYourIdentityVC
                self?.navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
    private func showToast(message: String, completion: (() -> Void)? = nil) {
        let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(toast, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            toast.dismiss(animated: true) {
                completion?() // Call the completion block after dismissing the toast
            }
        }
    }
    
    @IBAction func resendCodeBtnPressed(_ sender: UIButton) {
        // Reset the OTP text fields
        resetOTPTxtFlds()
        // Resend verification code
        sendCodeBtnPressed(sender)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        countryPickerLbl.text = dialCode
        countryCode = dialCode
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(countryPickerLabelTapped))
        countryPickerLbl.isUserInteractionEnabled = true
        countryPickerLbl.addGestureRecognizer(tapGesture)
    }
    
    func updateFont(){
        verifyLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        enterPhoneNumberLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 16.0))
    }
    
    func allTxtFldConfiguration(){
        otpTxtFld1.delegate = self
        otpTxtFld2.delegate = self
        otpTxtFld3.delegate = self
        otpTxtFld4.delegate = self
        otpTxtFld5.delegate = self
        otpTxtFld6.delegate = self
        
        otpTxtFld1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld5.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld6.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        otpTxtFld1.returnKeyType = .next
        otpTxtFld2.returnKeyType = .next
        otpTxtFld3.returnKeyType = .next
        otpTxtFld4.returnKeyType = .next
        otpTxtFld5.returnKeyType = .next
        otpTxtFld6.returnKeyType = .done
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        
        // Check if the replacement string will result in an empty text field
        if currentText.isEmpty {
            // If the current text field will be empty, clear it and move to the previous one
            switch textField {
            case otpTxtFld6:
                otpTxtFld6.text = ""
                otpTxtFld5.becomeFirstResponder()
            case otpTxtFld5:
                otpTxtFld5.text = ""
                otpTxtFld4.becomeFirstResponder()
            case otpTxtFld4:
                otpTxtFld4.text = ""
                otpTxtFld3.becomeFirstResponder()
            case otpTxtFld3:
                otpTxtFld3.text = ""
                otpTxtFld2.becomeFirstResponder()
            case otpTxtFld2:
                otpTxtFld2.text = ""
                otpTxtFld1.becomeFirstResponder()
            default:
                break
            }
            return false
        } else if currentText.count > 1 {
            // If the text field has more than one character, update the text to only the first character
            textField.text = String(currentText.prefix(1))
            textField.sendActions(for: .editingChanged)
            return false
        }
        
        // If neither of the above conditions is met, allow the change
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case otpTxtFld1:
                otpTxtFld2.becomeFirstResponder()
            case otpTxtFld2:
                otpTxtFld3.becomeFirstResponder()
            case otpTxtFld3:
                otpTxtFld4.becomeFirstResponder()
            case otpTxtFld4:
                otpTxtFld5.becomeFirstResponder()
            case otpTxtFld5:
                otpTxtFld6.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    private func resetOTPTxtFlds() {
        otpTxtFld1.text = ""
        otpTxtFld2.text = ""
        otpTxtFld3.text = ""
        otpTxtFld4.text = ""
        otpTxtFld5.text = ""
        otpTxtFld6.text = ""
        otpTxtFld1.becomeFirstResponder()
    }
}

