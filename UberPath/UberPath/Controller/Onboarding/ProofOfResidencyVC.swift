import UIKit
import ADCountryPicker

class ProofOfResidencyVC: UIViewController, ADCountryPickerDelegate {
    let picker = ADCountryPicker(style: .grouped)
    @IBOutlet weak var proofLbl: UILabel!
    @IBOutlet weak var proveLbl: UILabel!
    @IBOutlet weak var nationalityLbl: UILabel!
    @IBOutlet weak var methodsLbl: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        loadCountryFromUserDefaults()
    }
    
    func loadCountryFromUserDefaults() {
        let selectedCountry = UserDefaults.standard.string(forKey: "SelectedCountry")
        let selectedCountryCode = UserDefaults.standard.string(forKey: "SelectedCountryCode")
        countryLbl.text = selectedCountry
        if let countryCode = selectedCountryCode {
            let flagImage = picker.getFlag(countryCode: countryCode)
            countryImage.image = flagImage
        }
    }
    
    @IBAction func changeBtnPressed(_ sender: UIButton) {
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
    
    @IBAction func continueBtnPreesed(_ sender: UIButton) {
        // Perform the desired action on Continue button press
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CreateCardVC") as! CreateCardVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        proofLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        proveLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        nationalityLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        methodsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        let flagImage = picker.getFlag(countryCode: code)
        countryImage.image = flagImage
    }
    
}

extension ProofOfResidencyVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomBottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
