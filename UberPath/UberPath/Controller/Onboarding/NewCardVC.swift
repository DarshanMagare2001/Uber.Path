import UIKit

class NewCardVC: UIViewController, UITextFieldDelegate {
    var selectedImageName: String?
    
    @IBOutlet weak var cardDetailLbl: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNumberTxtFld: UITextField!
    @IBOutlet weak var expiryDateTxtFld: UITextField!
    @IBOutlet weak var vccTxtFld: UITextField!
    @IBOutlet weak var cardHolderTxtFld: UITextField!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updatePlaceHolders()
        cardNumberTxtFld.delegate = self
        expiryDateTxtFld.delegate = self
        vccTxtFld.delegate = self
        cardHolderTxtFld.delegate = self
        
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterFromKeyboardNotifications()
    }
    
    @IBAction func countryShowBtnPressed(_ sender: UIButton) {
        // Handle country button action
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        // Handle save button action
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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

