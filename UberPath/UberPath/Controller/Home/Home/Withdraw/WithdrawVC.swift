//
//  WithdrawVC.swift
//  UberPath
//
//  Created by IPS-161 on 17/07/23.
//

import UIKit

class WithdrawVC: UIViewController {
    @IBOutlet weak var btn1: RoundedButtonWithBorder!
    @IBOutlet weak var btn2: RoundedButtonWithBorder!
    @IBOutlet weak var btn3: RoundedButtonWithBorder!
    @IBOutlet weak var btn4: RoundedButtonWithBorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
