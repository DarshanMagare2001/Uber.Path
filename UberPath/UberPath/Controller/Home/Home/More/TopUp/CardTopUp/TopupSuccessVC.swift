//
//  TopupSuccessVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit
protocol popToRootVC {
    func popToRootVC(pop : Bool)
}
class TopupSuccessVC: UIViewController {
    var delegate : popToRootVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func backToHomeBtnPressed(_ sender: UIButton) {
       dismiss(animated: true)
        delegate?.popToRootVC(pop: true)
    }
}
