//
//  CameraVC.swift
//  UberPath
//
//  Created by IPS-161 on 28/06/23.
//

import UIKit

class CameraVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
