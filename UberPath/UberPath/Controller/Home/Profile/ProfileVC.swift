//
//  ProfileVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit


class ProfileVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    var cellAray : [String] = ["Referral Code","Account Info","Contact List","Language","General Setting","Change Password","Change Log In PIN","FAQs","Rate Us"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        if (indexPath.row + 1) % 4 == 0 {
            cell.divider.backgroundColor = UIColor.black
        } else {
            cell.divider.backgroundColor = UIColor.white
        }
        
        return cell
    }

   
}
