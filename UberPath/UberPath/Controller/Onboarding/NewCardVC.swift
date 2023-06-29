//
//  NewCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

class NewCardVC: UIViewController {
    
    var selectedImageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedImageName)
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
