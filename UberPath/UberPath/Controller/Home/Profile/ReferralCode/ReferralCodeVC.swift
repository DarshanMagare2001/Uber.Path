//
//  ReferralCodeVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class ReferralCodeVC: UIViewController {
    @IBOutlet weak var heresLb: UILabel!
    @IBOutlet weak var shareLbl: UILabel!
    @IBOutlet weak var getLbl: UILabel!
    @IBOutlet weak var forAmountLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        heresLb.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        shareLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 13.0))
        getLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        forAmountLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 13.0))
    }
    
}
