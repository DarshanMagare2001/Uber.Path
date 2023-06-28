//
//  VerifyYourIdentityVC.swift
//  UberPath
//
//  Created by IPS-161 on 27/06/23.
//

import UIKit

class VerifyYourIdentityVC: UIViewController {
    
    @IBOutlet weak var currentUserEmailLbl: UILabel!
    @IBOutlet weak var verifyLbl: UILabel!
    @IBOutlet weak var whereLbl: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    var viewModel = AuthenticationModel()
    var isSelected = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func selectBtnPressed(_ sender: UIButton) {
        isSelected.toggle()
        if isSelected {
            let image = UIImage(systemName: "circle.fill")
            selectBtn.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "circle")
            selectBtn.setImage(image, for: .normal)
        }
    }
    
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "ResetYourPasswordVC") as! ResetYourPasswordVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        verifyLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        whereLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 16.0))
        
        let text = "Where would you like Co.payment to send your security code?"
        let attributedString = NSMutableAttributedString(string: text)
        
        let greenRange = (text as NSString).range(of: "Co.payment")
        let greenColor = UIColor(named: "LaunchscreenColor")
        attributedString.addAttribute(.foregroundColor, value: greenColor, range: greenRange)
        
        whereLbl.attributedText = attributedString
    }
    
    private func showToast(message: String, completion: (() -> Void)? = nil) {
        let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(toast, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            toast.dismiss(animated: true) {
                completion?() // Call the completion block after dismissing the toast
            }
        }
    }
    
    
    
}
