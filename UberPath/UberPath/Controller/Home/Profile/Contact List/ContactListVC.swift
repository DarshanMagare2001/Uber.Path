//
//  ContactListVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class ContactListVC: UIViewController {
    @IBOutlet weak var recentContactsTableViewOutlet: UITableView!
    @IBOutlet weak var allContactsTableViewOutlet: UITableView!
    @IBOutlet weak var searchTxtFld: UITextField!
    var viewModel = cellData()
    override func viewDidLoad() {
        super.viewDidLoad()
        recentContactsTableViewOutlet.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "contactsCell")
        allContactsTableViewOutlet.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "contactsCell")
        searchTxtFld.placeholder = "Search"
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ContactListVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recentContactsTableViewOutlet {
            return viewModel.dataArray.count
        }else if tableView == allContactsTableViewOutlet{
            return viewModel.dataArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recentContactsTableViewOutlet {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsCell
            cell.userImage.image = UIImage(named: viewModel.dataArray[indexPath.row].name ?? "")
            cell.userName.text = viewModel.dataArray[indexPath.row].name
            cell.userNumber.text = viewModel.dataArray[indexPath.row].phoneNumber
            return cell
            
        }
        if tableView == allContactsTableViewOutlet{
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsCell
            cell.userImage.image = UIImage(named: viewModel.dataArray[indexPath.row].name ?? "")
            cell.userName.text = viewModel.dataArray[indexPath.row].name
            cell.userNumber.text = viewModel.dataArray[indexPath.row].phoneNumber
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
