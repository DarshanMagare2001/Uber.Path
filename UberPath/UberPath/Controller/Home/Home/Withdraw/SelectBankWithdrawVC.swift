//
//  SelectBankWithdrawVC.swift
//  UberPath
//
//  Created by IPS-161 on 17/07/23.
//

import UIKit

class SelectBankWithdrawVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
