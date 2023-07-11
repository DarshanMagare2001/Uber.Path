//
//  AccountInfoVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class AccountInfoVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var employerLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLbl()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLbl()
    }
    
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "EditAccountVC") as! EditAccountVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateLbl() {
        let defaults = UserDefaults.standard
        if let yourName = defaults.string(forKey: "yourName") {
            nameLbl.text = yourName
        }
        if let occupation = defaults.string(forKey: "occupation") {
            occupationLbl.text = occupation
        }
        if let employer = defaults.string(forKey: "employer") {
            employerLbl.text = employer
        }
        if let phoneNumber = defaults.string(forKey: "phoneNumber") {
            phoneNumberLbl.text = phoneNumber
        }
        if let email = defaults.string(forKey: "email") {
            emailLbl.text = email
        }
    }

    
}
