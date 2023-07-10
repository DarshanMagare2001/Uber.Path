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
    var cellAray : [String] = ["Referral Code","Account Info","Contact List","Language","General Setting","Change Password","Change Log In PIN","FAQs","Rate Us"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
    }
    
    
    func updateFont(){
        nameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        emailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
}

extension ProfileVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellAray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVCCell", for: indexPath) as! ProfileVCCell
        cell.img.image = UIImage(named: cellAray[indexPath.row])
        cell.cellLbl.text = cellAray[indexPath.row]
        cell.divider.isHidden = !(indexPath.row == 3 || indexPath.row == 6)
        
        // Set button action for the desired cell
        if indexPath.row == 1 {
            cell.buttonAction = { [weak self] in
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "AccountInfoVC") as! AccountInfoVC
                self?.navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
        
        return cell
    }

    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 1 {
//            let storyboard = UIStoryboard(name: "Home", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "ScanQRCodeVC") as! ScanQRCodeVC
//            navigationController?.pushViewController(destinationVC, animated: true)
//        }
//    }
    
    
}
