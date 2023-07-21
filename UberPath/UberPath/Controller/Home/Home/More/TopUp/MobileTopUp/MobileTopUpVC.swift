//
//  MobileTopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class MobileTopUpVC: UIViewController {
    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var tableViewTwo: UITableView!
    var viewModel = MobileTopUpTableViewModelClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MobileTopUpTableViewCell", bundle: nil)
        tableViewOne.register(nib, forCellReuseIdentifier: "MobileTopUpTableViewCell")
        tableViewTwo.register(nib, forCellReuseIdentifier: "MobileTopUpTableViewCell")
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MobileTopUpVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableViewOne {
            return 2
        }
        if tableView == tableViewTwo {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobileTopUpTableViewCell", for: indexPath) as! MobileTopUpTableViewCell
        let dataFortableViewOne = viewModel.modelArray
        let dataFortableViewTwo = viewModel.modelArray.enumerated().filter { $0.offset > 1 }.map { $0.element }
        if tableView == tableViewOne {
            cell.img.image = UIImage(named: dataFortableViewOne[indexPath.row].img)
            cell.lbl1.text = dataFortableViewOne[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewOne[indexPath.row].lbl2
            return cell
        }
        
        if tableView == tableViewTwo {
            cell.img.image = UIImage(named: dataFortableViewTwo[indexPath.row].img)
            cell.lbl1.text = dataFortableViewTwo[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewTwo[indexPath.row].lbl2
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewOne {
            // Deselect all cells in tableViewOne except the selected one
            for row in 0..<tableViewOne.numberOfRows(inSection: indexPath.section) {
                if let cell = tableViewOne.cellForRow(at: IndexPath(row: row, section: indexPath.section)) as? MobileTopUpTableViewCell {
                    cell.btn.isSelected = (indexPath.row == row)
                    cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
                }
            }
            
            // Do something with the selected cell data (if needed)
            let dataFortableViewOne = viewModel.modelArray
            let selectedData = dataFortableViewOne[indexPath.row]
            // Use selectedData as needed...
            
        } else if tableView == tableViewTwo {
            // Deselect all cells in tableViewTwo except the selected one
            for row in 0..<tableViewTwo.numberOfRows(inSection: indexPath.section) {
                if let cell = tableViewTwo.cellForRow(at: IndexPath(row: row, section: indexPath.section)) as? MobileTopUpTableViewCell {
                    cell.btn.isSelected = (indexPath.row == row)
                    cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
                }
            }
            
            // Do something with the selected cell data (if needed)
            let dataFortableViewTwo = viewModel.modelArray.enumerated().filter { $0.offset > 1 }.map { $0.element }
            let selectedData = dataFortableViewTwo[indexPath.row]
            // Use selectedData as needed...
        }
    }
    
}
