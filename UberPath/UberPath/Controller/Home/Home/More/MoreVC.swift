//
//  MoreVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    var cellModelArray = ["ATM Finder","Chat Asistant","TopUp"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MoreVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreVCTableViewCell", for: indexPath) as! MoreVCTableViewCell
        cell.img.image = UIImage(named: cellModelArray[indexPath.row])
        cell.lbl.text = cellModelArray[indexPath.row]
        cell.buttonTapHandler = { [weak self] in
            if indexPath.row == 0 {
                guard let destinationVC = self?.storyboard?.instantiateViewController(withIdentifier: "ATMFinderVC") as? ATMFinderVC else {
                    return
                }
                self?.navigationController?.pushViewController(destinationVC, animated: true)
            }else if indexPath.row == 1{
                guard let destinationVC = self?.storyboard?.instantiateViewController(withIdentifier: "ChatAsistantVC") as? ChatAsistantVC else {
                    return
                }
                self?.navigationController?.pushViewController(destinationVC, animated: true)
            }else if indexPath.row == 2 {
                guard let destinationVC = self?.storyboard?.instantiateViewController(withIdentifier: "TopUpVC") as? TopUpVC else {
                    return
                }
                self?.navigationController?.pushViewController(destinationVC, animated: true)
            }
            
        }
        return cell
    }
}
