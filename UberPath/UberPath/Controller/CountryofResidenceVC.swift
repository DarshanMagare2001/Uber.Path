import UIKit
import ADCountryPicker

struct MyCustomCountry {
    let name: String
    let isoCode: String
}

protocol CountrySelectionDelegate: AnyObject {
    func didSelectCountry(_ country: MyCustomCountry)
}

class CountryofResidenceVC: UIViewController, CountrySelectionDelegate, ADCountryPickerDelegate {
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        
    }
    
    weak var delegate: CountrySelectionDelegate?
    
    @IBOutlet weak var countryImgView: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
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
            let selectedCountry = MyCustomCountry(name: name, isoCode: code)
            self.delegate?.didSelectCountry(selectedCountry)
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

    // MARK: - Country Selection Delegate

    func didSelectCountry(_ country: MyCustomCountry) {
        countryLbl.text = country.name
        // Use ISO code as a placeholder for the flag image
        if let flagImage = UIImage(named: country.isoCode.lowercased()) {
            countryImgView.image = flagImage
        } else {
            countryImgView.image = nil
        }
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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

