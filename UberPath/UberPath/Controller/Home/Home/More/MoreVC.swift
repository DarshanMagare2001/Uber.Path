//
//  MoreVC.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    var cellModelArray = ["ATM Finder","Chat Assistant","TopUp"]
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
        return cell
    }
}
