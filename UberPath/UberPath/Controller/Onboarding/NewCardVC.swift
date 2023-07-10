import UIKit
import ADCountryPicker

class NewCardVC: UIViewController, UITextFieldDelegate ,ADCountryPickerDelegate{
    @IBOutlet weak var cardDetailLbl: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNumberTxtFld: UITextField!
    @IBOutlet weak var expiryDateTxtFld: UITextField!
    @IBOutlet weak var vccTxtFld: UITextField!
    @IBOutlet weak var cardHolderTxtFld: UITextField!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var popUpView: UIView!
    var selectedImageName: String?
    let picker = ADCountryPicker(style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.isHidden = true
        guard let image = UIImage(named: selectedImageName ?? "") else { return }
        cardImageView.image = image
        updateFont()
        updatePlaceHolders()
        cardNumberTxtFld.delegate = self
        expiryDateTxtFld.delegate = self
        vccTxtFld.delegate = self
        cardHolderTxtFld.delegate = self
        registerForKeyboardNotifications()
        loadCountryFromUserDefaults()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popUpViewTapped))
        popUpView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterFromKeyboardNotifications()
    }
    
    @objc private func popUpViewTapped() {
        popUpView.isHidden = true
    }
    
    func loadCountryFromUserDefaults() {
        let selectedCountry = UserDefaults.standard.string(forKey: "SelectedCountry")
        let selectedCountryCode = UserDefaults.standard.string(forKey: "SelectedCountryCode")
        countryLbl.text = selectedCountry
        if let countryCode = selectedCountryCode {
            let flagImage = picker.getFlag(countryCode: countryCode)
            countryImageView.image = flagImage
        }
    }
    
    
    @IBAction func countryBtnPressed(_ sender: UIButton) {
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
            self.countryLbl.text = name
            // Save selected country to UserDefaults
            UserDefaults.standard.set(name, forKey: "SelectedCountry")
            UserDefaults.standard.set(code, forKey: "SelectedCountryCode")
            self.dismiss(animated: true, completion: nil)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            picker.modalPresentationStyle = .popover
            picker.popoverPresentationController?.sourceView = sender
            picker.popoverPresentationController?.sourceRect = sender.bounds
        } else {
            picker.modalPresentationStyle = .custom
            picker.transitioningDelegate = self
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        popUpView.isHidden = false
        // Handle save button action
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.alpha = 1.0
        }) { (_) in
            // Animation completion
        }
    }
    
    @IBAction func okBtnPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.alpha = 0.0
        }) { (_) in
            // Animation completion
            let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let destinationVC = storyBoard.instantiateViewController(withIdentifier: "MainTabVC") as! MainTabVC
            // Store selectedImageName in UserDefaults
            let selectedImageName = self.selectedImageName
            UserDefaults.standard.set(selectedImageName, forKey: "SelectedImageName")
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
        popUpView.isHidden = true
    }

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        let flagImage = picker.getFlag(countryCode: code)
        countryImageView.image = flagImage
    }
    
    func updateFont() {
        cardDetailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    func updatePlaceHolders() {
        cardNumberTxtFld.placeholder = "Card number"
        expiryDateTxtFld.placeholder = "Expiry date"
        vccTxtFld.placeholder = "VCC"
        cardHolderTxtFld.placeholder = "Card holder"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Keyboard Handling
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                  return
              }
        
        let keyboardHeight = keyboardFrame.height
        let safeAreaBottomInset = view.safeAreaInsets.bottom
        
        scrollView.contentInset.bottom = keyboardHeight - safeAreaBottomInset
        scrollView.scrollIndicatorInsets.bottom = keyboardHeight - safeAreaBottomInset
        
        if let activeTextField = findActiveTextField(),
           let activeTextFieldFrame = activeTextField.superview?.convert(activeTextField.frame, to: scrollView) {
            let visibleContentHeight = max(0, scrollView.bounds.height - keyboardHeight + safeAreaBottomInset)
            
            if !(0...visibleContentHeight).contains(activeTextFieldFrame.maxY) {
                let scrollOffset = CGPoint(x: 0, y: activeTextFieldFrame.maxY - visibleContentHeight)
                scrollView.setContentOffset(scrollOffset, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    func findActiveTextField() -> UITextField? {
        let textFields: [UITextField] = [
            cardNumberTxtFld,
            expiryDateTxtFld,
            vccTxtFld,
            cardHolderTxtFld
        ]
        return textFields.first { $0.isFirstResponder }
    }
}

extension NewCardVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomBottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
