//
//  EditCardVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class EditCardVC: UIViewController {
    var cardImage : String?
    @IBOutlet weak var personLblView: UIView!
    @IBOutlet weak var personLbl: UILabel!
    @IBOutlet weak var manageLblView: UIView!
    @IBOutlet weak var manageLbl: UILabel!
    @IBOutlet weak var detailLblView: UIView!
    @IBOutlet weak var detailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont(){
        personLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        manageLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        detailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
    }
    
}
