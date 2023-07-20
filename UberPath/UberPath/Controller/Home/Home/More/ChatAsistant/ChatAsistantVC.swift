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
        if let message = msgTxtFld.text, !message.isEmpty {
            viewModel.modelArray.append(message)
            msgTxtFld.text = "" // Clear the text field after sending the message
            tableViewOutlet.reloadData()
        } else {
            showAlert(message: "Please type a message first!")
        }
    }
    
    // Function to show a simple alert with the given message
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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
            cell.v2.isHidden = false
        } else {
            cell.msgLbl.text = viewModel.modelArray[indexPath.row]
            cell.msgLbl.textColor = .white
            cell.msgView.backgroundColor = UIColor(named: "GlobalButtonColor")
            cell.v2.isHidden = true
            cell.v1.isHidden = false
        }
        return cell
    }
}
