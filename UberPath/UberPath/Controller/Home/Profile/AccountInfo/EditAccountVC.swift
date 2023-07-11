import UIKit

class EditAccountVC: UIViewController {
    @IBOutlet weak var yourNameLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var employerLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var yourNameTxtFld: UITextField!
    @IBOutlet weak var occupationTxtFld: UITextField!
    @IBOutlet weak var employerTxtFld: UITextField!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.isHidden = true
        activityLoader.startAnimating()
        updateFont()
        updateTxtFlds()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if yourNameTxtFld.text != "" || occupationTxtFld.text != "" || employerTxtFld.text != "" || phoneNumberTxtFld.text != "" || emailTxtFld.text != "" {
            popUpView.isHidden = false
            saveDataToUserDefaults()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.popUpView.isHidden = true
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            showAlert(message: "Please fill in all information.")
        }
    }
    
    func saveDataToUserDefaults() {
        let defaults = UserDefaults.standard
        if yourNameTxtFld.text != "" {
            defaults.setValue(yourNameTxtFld.text, forKey: "yourName")
        }
        if occupationTxtFld.text != "" {
            defaults.setValue(occupationTxtFld.text, forKey: "occupation")
        }
        if employerTxtFld.text != "" {
            defaults.setValue(employerTxtFld.text, forKey: "employer")
        }
        if phoneNumberTxtFld.text != "" {
            defaults.setValue(phoneNumberTxtFld.text, forKey: "phoneNumber")
        }
        if emailTxtFld.text != "" {
            defaults.setValue(emailTxtFld.text, forKey: "email")
        }
    }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Incomplete Information", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateFont() {
        yourNameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        occupationLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        employerLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        phoneNumberLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        emailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
    }
    
    func updateTxtFlds() {
        let defaults = UserDefaults.standard
        if let yourName = defaults.string(forKey: "yourName") {
            yourNameTxtFld.placeholder = yourName
        }else{
            yourNameTxtFld.placeholder = "Darshan Magare"
        }
        if let occupation = defaults.string(forKey: "occupation") {
            occupationTxtFld.placeholder = occupation
        }else{
            occupationTxtFld.placeholder = "Manager"
        }
        
        if let employer = defaults.string(forKey: "employer") {
            employerTxtFld.placeholder = employer
        }else{
            employerTxtFld.placeholder = "Overlay Design"
        }
        
        if let phoneNumber = defaults.string(forKey: "phoneNumber") {
            phoneNumberTxtFld.placeholder = phoneNumber
        }else{
            phoneNumberTxtFld.placeholder = "(1) 3256 8456 888"
        }
        
        if let email = defaults.string(forKey: "email") {
            emailTxtFld.placeholder = email
        } else {
            emailTxtFld.placeholder = "darshan@gmail.com"
        }
        phoneNumberTxtFld.keyboardType = .numberPad
    }
    
}

