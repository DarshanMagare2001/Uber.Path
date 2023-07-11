//
//  AccountInfoVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class AccountInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "EditAccountVC") as! EditAccountVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
