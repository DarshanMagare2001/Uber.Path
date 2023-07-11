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
    @IBOutlet weak var editBtnImageView: UIImageView!
    
    @IBOutlet weak var userImageView: UIImageView!
    
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
        }else{
            nameLbl.text = "Darshan Magare"
        }
        if let occupation = defaults.string(forKey: "occupation") {
            occupationLbl.text = occupation
        }else{
            occupationLbl.text = "Manager"
        }
        
        if let employer = defaults.string(forKey: "employer") {
            employerLbl.text = employer
        }else{
            employerLbl.text = "Overlay Design"
        }
        
        if let phoneNumber = defaults.string(forKey: "phoneNumber") {
            phoneNumberLbl.text = phoneNumber
        }else{
            phoneNumberLbl.text = "(1) 3256 8456 888"
        }
        
        if let email = defaults.string(forKey: "email") {
            emailLbl.text = email
        } else {
            emailLbl.text = "darshan@gmail.com"
        }
        
    }
    
}
