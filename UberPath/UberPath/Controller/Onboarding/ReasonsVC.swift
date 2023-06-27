//
//  ReasonsVC.swift
//  UberPath
//
//  Created by IPS-161 on 27/06/23.
//

import UIKit

class ReasonsVC: UIViewController {
    @IBOutlet weak var mainReasonLbl: UILabel!
    @IBOutlet weak var weNeedlbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    func updateFont(){
        mainReasonLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        weNeedlbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
    
}
