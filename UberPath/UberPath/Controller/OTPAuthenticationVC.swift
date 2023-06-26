//
//  OTPAuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 26/06/23.
//

import UIKit

class OTPAuthenticationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
      
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
     
}
