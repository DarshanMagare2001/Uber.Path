//
//  ProfileVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var userImageView: CircleImageView!
    let cellArray: [ProfileCell] = [.referralCode, .accountInfo, .contactList, .language, .generalSetting, .changePassword, .changeLogInPin, .FAQs,.addFingerprint]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUserInfo()
    }
    
    func updateFont() {
        nameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        emailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    func updateUserInfo(){
        let defaults = UserDefaults.standard
        if let yourName = defaults.string(forKey: "yourName") {
            nameLbl.text = yourName
        } else {
            nameLbl.text = "Darshan Magare"
        }
        if let email = defaults.string(forKey: "email") {
            emailLbl.text = email
        } else {
            emailLbl.text = "darshan@gmail.com"
        }
        if let imageData = defaults.data(forKey: "userImage") {
            if let image = UIImage(data: imageData) {
                userImageView.image = image
            }
        }
    }
    
}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVCCell", for: indexPath) as! ProfileVCCell
        
        let cellType = cellArray[indexPath.row]
        cell.img.image = UIImage(named: cellType.title)
        cell.cellLbl.text = cellType.title
        cell.divider.isHidden = !(indexPath.row == 3 || indexPath.row == 6)
        
        cell.buttonAction = { [weak self] in
            let destinationVC = cellType.viewController
            self?.navigationController?.pushViewController(destinationVC, animated: true)
        }
        
        return cell
    }
}
