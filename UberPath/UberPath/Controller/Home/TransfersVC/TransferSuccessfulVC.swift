//
//  TransferSuccessfulVC.swift
//  UberPath
//
//  Created by IPS-161 on 06/07/23.
//

import UIKit

class TransferSuccessfulVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func backToHomeBtnPressed(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
