//
//  OTPAuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 26/06/23.
//

import UIKit

class OTPAuthenticationVC: UIViewController {
    var email : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(email!)
        
    }
      
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
     
}
