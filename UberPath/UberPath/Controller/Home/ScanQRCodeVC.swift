//
//  ScanQRCodeVC.swift
//  UberPath
//
//  Created by IPS-161 on 04/07/23.
//

import UIKit

class ScanQRCodeVC: UIViewController {
    
    @IBOutlet weak var warninglbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    func updateFont(){
        warninglbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        
    }
    
    
}
