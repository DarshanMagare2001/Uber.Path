//
//  TransferSuccessfulVC.swift
//  UberPath
//
//  Created by IPS-161 on 06/07/23.
//

import UIKit

class TransferSuccessfulVC: UIViewController {
    @IBOutlet weak var transferLbl: UILabel!
    @IBOutlet weak var transferReviewlbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    var amount : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        guard let money = amount else {return}
        amountLbl.text = money
    }
    
    @IBAction func backToHomeBtnPressed(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        transferLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        transferReviewlbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        amountLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
}
