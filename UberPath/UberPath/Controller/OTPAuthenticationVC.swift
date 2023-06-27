//
//  OTPAuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 26/06/23.
//

import UIKit

class OTPAuthenticationVC: UIViewController {
    @IBOutlet weak var verifyLbl: UILabel!
    @IBOutlet weak var enterPhoneNumberLbl: UILabel!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var otpTxtFld1: UITextField!
    @IBOutlet weak var otpTxtFld2: UITextField!
    @IBOutlet weak var otpTxtFld3: UITextField!
    @IBOutlet weak var otpTxtFld4: UITextField!
    @IBOutlet weak var otpTxtFld5: UITextField!
    @IBOutlet weak var otpTxtFld6: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func sendcodeBtnPressed(_ sender: UIButton) {
        
        
        
    }
    
    
    @IBAction func resendCodeBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        
        
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
