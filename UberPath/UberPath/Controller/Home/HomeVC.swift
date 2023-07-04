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
    
    
    @IBAction func depositBtnPressed(_ sender: Any) {
        print("Deposit")
    }
    
    
    @IBAction func transfersBtnPressed(_ sender: UIButton) {
        print("Done")
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransfersVC") as! TransfersVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func withdrawBtnPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func moreBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    func updateFont(){
        welcomeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        nameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    
}
