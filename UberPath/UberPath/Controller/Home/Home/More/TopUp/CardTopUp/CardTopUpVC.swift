//
//  CardTopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class CardTopUpVC: UIViewController {
    @IBOutlet weak var currencySymbolBtn: UIButton!
    @IBOutlet weak var currencyShowLbl: UILabel!
    
    @IBOutlet weak var amountTxtFld: UITextField!
    
    @IBOutlet weak var currencySymbolPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func currencySymbolShowBtnPressed(_ sender: UIButton) {
        
    }
    
}
