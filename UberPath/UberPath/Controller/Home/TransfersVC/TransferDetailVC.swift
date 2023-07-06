//
//  TransferDetailVC.swift
//  UberPath
//
//  Created by IPS-161 on 06/07/23.
//

import UIKit

class TransferDetailVC: UIViewController {
    
    @IBOutlet weak var currencyPickerView: UIView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var currencyShowLbl: UILabel!
    
    
    @IBOutlet weak var currencyTxtFld: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerView.isHidden = true
        
    }
    
    
    @IBAction func currencyPickerBtnPressed(_ sender: UIButton) {
        currencyPickerView.isHidden.toggle()
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnPresed(_ sender: UIButton) {
        
    }
    
    
}
