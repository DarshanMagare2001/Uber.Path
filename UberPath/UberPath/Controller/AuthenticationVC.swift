//
//  AuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 23/06/23.
//

import UIKit

class AuthenticationVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backArrowBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
