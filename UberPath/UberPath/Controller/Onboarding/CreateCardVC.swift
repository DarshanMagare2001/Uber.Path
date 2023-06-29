//
//  CreateCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

class CreateCardVC: UIViewController {
    @IBOutlet weak var createLbl: UILabel!
    @IBOutlet weak var theCustomizeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        createLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 21.0))
        theCustomizeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 13.0))
    }
    
}
