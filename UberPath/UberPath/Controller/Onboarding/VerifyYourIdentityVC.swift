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
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func selectBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        
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
    
    
    
    
    
}
