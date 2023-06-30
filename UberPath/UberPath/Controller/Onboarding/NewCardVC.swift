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
    
   



    
  
}

