//
//  ATMFinderVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class ATMFinderVC: UIViewController {
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nowBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ATMFinderDetailVC") as! ATMFinderDetailVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateFont(){
        lbl1.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 25.0))
        lbl2.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 14.0))
    }
    
}
