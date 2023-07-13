//
//  ScanQRCodeVC.swift
//  UberPath
//
//  Created by IPS-161 on 04/07/23.
//

import UIKit

class ScanQRCodeVC: UIViewController {
    @IBOutlet weak var warninglbl: UILabel!
    @IBOutlet weak var ScanQRView: UIView!
    @IBOutlet weak var ReadyCodeView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var threeDotsBtn: UIButton!
    @IBOutlet weak var showQrLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        ReadyCodeView.isHidden = true
    }
    
    
    @IBAction func scanQrBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: {
            self.ScanQRView.isHidden = true
            self.ReadyCodeView.isHidden = false
            self.backBtn.tintColor = UIColor.black
            self.threeDotsBtn.tintColor = UIColor.black
            self.showQrLbl.textColor = UIColor.black
        }, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    func updateFont(){
        warninglbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
        
    }
    
    
}
