//
//  ATMFinderDetailVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class ATMFinderDetailVC: UIViewController {
    @IBOutlet weak var popUpView: ShadowedView!
    @IBOutlet weak var searchTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.isHidden = true
        searchTxtFld.text = "Bank of America ATM"
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
    @IBAction func getDirectionBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ATMFinderResultVC") as! ATMFinderResultVC
        // Set the modal presentation style to .overFullScreen or .overCurrentContext
        destinationVC.modalPresentationStyle = .overFullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
}
