import UIKit
import FirebaseAuth
import ADCountryPicker

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
        tapGesture()
        allTxtFldConfiguration()
        addDoneButtonToNumberPad()
        
        
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
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        countryPickerLbl.text = dialCode
        countryCode = dialCode
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(countryPickerLabelTapped))
        countryPickerLbl.isUserInteractionEnabled = true
        countryPickerLbl.addGestureRecognizer(tapGesture)
    }
    
    func allTxtFldConfiguration(){
        // Set input type to number pad for OTP text fields
        otpTxtFld1.keyboardType = .numberPad
        otpTxtFld2.keyboardType = .numberPad
        otpTxtFld3.keyboardType = .numberPad
        otpTxtFld4.keyboardType = .numberPad
        otpTxtFld5.keyboardType = .numberPad
        otpTxtFld6.keyboardType = .numberPad
        phoneNumberTxtFld.keyboardType = .numberPad
        
        // Add target to each OTP text field to handle automatic movement to the next field
        otpTxtFld1.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld2.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld3.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld4.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld5.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        otpTxtFld6.addTarget(self, action: #selector(otpTextFieldDidChange(_:)), for: .editingChanged)
        
        // Set the delegate for all OTP text fields
        otpTxtFld1.delegate = self
        otpTxtFld2.delegate = self
        otpTxtFld3.delegate = self
        otpTxtFld4.delegate = self
        otpTxtFld5.delegate = self
        otpTxtFld6.delegate = self
        phoneNumberTxtFld.delegate = self
    }
    
    @objc func otpTextFieldDidChange(_ textField: UITextField) {
        let textCount = textField.text?.count ?? 0
        let maxLength = 1
        
        if textCount >= maxLength {
            moveToNextTextField(textField)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        
        // Detect backspace button press
        if string.isEmpty && currentText.isEmpty {
            switch textField {
            case otpTxtFld2:
                otpTxtFld1.becomeFirstResponder()
            case otpTxtFld3:
                otpTxtFld2.becomeFirstResponder()
            case otpTxtFld4:
                otpTxtFld3.becomeFirstResponder()
            case otpTxtFld5:
                otpTxtFld4.becomeFirstResponder()
            case otpTxtFld6:
                otpTxtFld5.becomeFirstResponder()
            default:
                break
            }
        }
        
        return true
    }
    
    private func moveToNextTextField(_ textField: UITextField) {
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
            otpTxtFld6.resignFirstResponder()
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
    
    private func showToast(message: String) {
        let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(toast, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            toast.dismiss(animated: true)
        }
    }
    
    private func addDoneButtonToNumberPad() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.items = [flexSpace, doneButton]
        phoneNumberTxtFld.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }
    
    
}

