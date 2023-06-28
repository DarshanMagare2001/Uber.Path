//
//  ProofOfResidencyVC.swift
//  UberPath
//
//  Created by IPS-161 on 28/06/23.
//

import UIKit

class ProofOfResidencyVC: UIViewController {
    @IBOutlet weak var proofLbl: UILabel!
    @IBOutlet weak var proveLbl: UILabel!
    @IBOutlet weak var nationalityLbl: UILabel!
    @IBOutlet weak var methodsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
     
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        proofLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        proveLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        nationalityLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        methodsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
}
