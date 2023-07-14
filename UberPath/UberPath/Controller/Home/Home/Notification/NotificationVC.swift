//
//  NotificationVC.swift
//  UberPath
//
//  Created by IPS-161 on 13/07/23.
//

import UIKit

class NotificationVC: UIViewController {
    @IBOutlet weak var todayTableView: UITableView!
    @IBOutlet weak var thisWeekTableView: UITableView!
    var viewModel = NotificationVCModelClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NotificationVCCell", bundle: nil)
        todayTableView.register(nib, forCellReuseIdentifier: "notificationVCCell")
        thisWeekTableView.register(nib, forCellReuseIdentifier: "notificationVCCell")
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension NotificationVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == todayTableView {
            return 2
        }
        if tableView == thisWeekTableView{
            return viewModel.NotificationVCModelClassArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationVCCell", for: indexPath) as!NotificationVCCell
        if tableView == todayTableView {
            cell.cellImage.image = UIImage(named:viewModel.NotificationVCModelClassArray[indexPath.row].image)
            cell.cellLbl1.text = viewModel.NotificationVCModelClassArray[indexPath.row].lbl1
            cell.cellLbl2.text = viewModel.NotificationVCModelClassArray[indexPath.row].lbl2
            cell.cellLbl3.text = viewModel.NotificationVCModelClassArray[indexPath.row].time
            return cell
        }
        if tableView == thisWeekTableView{
            cell.cellImage.image = UIImage(named:viewModel.NotificationVCModelClassArray[indexPath.row].image)
            cell.cellLbl1.text = viewModel.NotificationVCModelClassArray[indexPath.row].lbl1
            cell.cellLbl2.text = viewModel.NotificationVCModelClassArray[indexPath.row].lbl2
            cell.cellLbl3.text = viewModel.NotificationVCModelClassArray[indexPath.row].time
            return cell
        }
        return UITableViewCell()
    }
}
