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
    @IBOutlet weak var spendLbl: UILabel!
    @IBOutlet weak var fastLbl: UILabel!
    @IBOutlet weak var paymentsLbl: UILabel!
    @IBOutlet weak var onlinePaymentLbl: UILabel!
    @IBOutlet weak var spendWhileLbl: UILabel!
    @IBOutlet weak var yourLbl: UILabel!
    
    @IBOutlet weak var spendView: UIView!
    @IBOutlet weak var fastView: UIView!
    @IBOutlet weak var paymentsView: UIView!
    @IBOutlet weak var onlinePaymentView: UIView!
    @IBOutlet weak var spendWhileView: UIView!
    @IBOutlet weak var yourView: UIView!
    
    
    
    
    
    
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
        weNeedlbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        spendLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        fastLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        paymentsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        onlinePaymentLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        spendWhileLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        yourLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
    }
    
    
}
