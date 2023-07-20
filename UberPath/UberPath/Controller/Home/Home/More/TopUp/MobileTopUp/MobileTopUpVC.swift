//
//  MobileTopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class MobileTopUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
