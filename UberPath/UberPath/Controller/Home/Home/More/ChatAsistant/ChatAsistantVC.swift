//
//  ChatAsistantVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class ChatAsistantVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var msgTxtFld: UITextField!
    
    var viewModel = ChatAsistantVCTableViewModelClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        msgTxtFld.placeholder = "Type here..."
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendMsgBtnPressed(_ sender: UIButton) {
        
    }
    
}

extension ChatAsistantVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatAsistantVCTableViewCell", for: indexPath) as! ChatAsistantVCTableViewCell
        if indexPath.row == 0 || indexPath.row == 2 {
            cell.msgLbl.text = viewModel.modelArray[indexPath.row]
            cell.msgLbl.textColor = UIColor(named: "GlobalButtonColor")
            cell.msgView.backgroundColor = .systemGray6
            cell.v1.isHidden = true
        } else {
            cell.msgLbl.text = viewModel.modelArray[indexPath.row]
            cell.msgLbl.textColor = .white
            cell.msgView.backgroundColor = UIColor(named: "GlobalButtonColor")
            cell.v2.isHidden = true
        }
        return cell
    }
}
