import UIKit
import ADCountryPicker

struct MyCustomCountry {
    let name: String
    let isoCode: String
    let dialCode: String
}

//This is CountryofResidenceVC class which allows us to choose countries

class CountryofResidenceVC: UIViewController, ADCountryPickerDelegate {
    
    @IBOutlet weak var countryImgView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryOfReseidenceLbl: UILabel!
    @IBOutlet weak var PleaseSelectLbl: UILabel!
    var countryCode : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
    }
    
    @IBAction func countryShowBtnPressed(_ sender: UIButton) {
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
            picker.popoverPresentationController?.sourceView = sender
            picker.popoverPresentationController?.sourceRect = sender.bounds
        } else {
            picker.modalPresentationStyle = .custom
            picker.transitioningDelegate = self
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        // Store the selected country name and code in UserDefaults
        let selectedCountryName = countryLbl.text ?? ""
        let selectedCountryCode = countryCode
        UserDefaults.standard.set(selectedCountryName, forKey: "SelectedCountry")
        UserDefaults.standard.set(selectedCountryCode, forKey: "SelectedCountryCode")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "ReasonsVC") as! ReasonsVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Country Selection Delegate
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        countryLbl.text = name
        let flagImage = picker.getFlag(countryCode: code)
        countryImgView.image = flagImage
        countryCode = code
    }
    
    func updateFont() {
        countryOfReseidenceLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        PleaseSelectLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 16.0))
    }
    
}

// MARK: - UIViewControllerTransitioningDelegate

extension CountryofResidenceVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomBottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// Custom Presentation Controller for Bottom Sheet Style

class CustomBottomSheetPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        let containerViewBounds = containerView?.bounds ?? CGRect.zero
        let height: CGFloat = 400 // Adjust the height as per your requirement
        return CGRect(x: 0, y: containerViewBounds.height - height, width: containerViewBounds.width, height: height)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else { return }
        
        let dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        containerView.addSubview(dimmingView)
        
        presentedViewController.view.layer.cornerRadius = 12
        presentedViewController.view.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        dimmingView.addGestureRecognizer(tapGesture)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        containerView?.subviews.last?.removeFromSuperview()
    }
    
    @objc func dimmingViewTapped() {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}

