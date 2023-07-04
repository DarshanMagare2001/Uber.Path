//
//  HomeVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    func updateFont(){
        welcomeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        nameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    
}
