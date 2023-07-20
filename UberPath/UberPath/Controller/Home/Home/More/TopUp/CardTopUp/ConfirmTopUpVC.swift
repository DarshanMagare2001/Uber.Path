//
//  ConfirmTopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class ConfirmTopUpVC: UIViewController, popToRootVC {
    @IBOutlet weak var topUpBalanceLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    var topUpBalance : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLbl()
        
    }
    @IBAction func confirmTopUpBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TopupSuccessVC") as! TopupSuccessVC
        destinationVC.modalPresentationStyle = .overFullScreen
        destinationVC.delegate = self
        present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateLbl(){
        guard let data = topUpBalance else { return }
        topUpBalanceLbl.text = "\(data)"
        totalLbl.text = "\(data + 3)" 
    }
    
    func popToRootVC(pop: Bool) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
