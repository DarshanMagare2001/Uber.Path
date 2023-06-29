//
//  NewCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

class NewCardVC: UIViewController {
    var selectedImageName : String?
    @IBOutlet weak var cardDetailLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedImageName)
        updateFont()
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        cardDetailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
    }
    
    
}
