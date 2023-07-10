//
//  EditCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class EditCardVC: UIViewController {
    var cardImage : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
