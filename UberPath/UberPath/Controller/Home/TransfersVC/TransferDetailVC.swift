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
        addDoneButtonToCurrencyTextField()
    }
    
    @IBAction func currencyPickerBtnPressed(_ sender: UIButton) {
        currencyPickerView.isHidden.toggle()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnPresed(_ sender: UIButton) {
        
    }
    
    private func addDoneButtonToCurrencyTextField() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))

        toolbar.items = [flexibleSpace, doneButton]
        currencyTxtFld.inputAccessoryView = toolbar
    }

    @objc private func doneButtonPressed() {
        currencyTxtFld.resignFirstResponder()
    }
    
}
