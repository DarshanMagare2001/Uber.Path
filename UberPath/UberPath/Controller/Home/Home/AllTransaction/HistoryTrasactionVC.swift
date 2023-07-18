//
//  HistoryTrasactionVC.swift
//  UberPath
//
//  Created by IPS-161 on 18/07/23.
//

import UIKit

class HistoryTrasactionVC: UIViewController {
    @IBOutlet weak var amountShowLblView: UIView!
    @IBOutlet weak var amountHideShowBtn: UIButton!
    var isAmountShow = true
    override func viewDidLoad() {
        super.viewDidLoad()
        amountShowLblView.isHidden = false
        
    }
    
    @IBAction func amountHideShowBtnPressed(_ sender: UIButton) {
        amountShowLblView.isHidden.toggle()
        isAmountShow.toggle()
        if isAmountShow {
            let image = UIImage(systemName: "eye")
            amountHideShowBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            amountHideShowBtn.setImage(image, for: .normal)
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
