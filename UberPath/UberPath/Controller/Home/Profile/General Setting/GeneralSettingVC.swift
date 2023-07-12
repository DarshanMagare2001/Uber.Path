//
//  GeneralSettingVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class GeneralSettingVC: UIViewController {
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var lbl8: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        lbl1.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        lbl2.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        lbl3.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        lbl4.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        lbl5.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        lbl6.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        lbl7.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        lbl8.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
    }
    
}
