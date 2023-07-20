//
//  TopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class TopUpVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cardTopUpBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CardTopUpVC") as! CardTopUpVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func mobileTopUpBtnPressed(_ sender: UIButton) {
        
    }
    
    
}
