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
    var selectedIndexPathTableViewOne: IndexPath?
    var selectedIndexPathTableViewTwo: IndexPath?
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
            // Deselect all cells in tableViewTwo
            deselectAllCells(tableView: tableViewTwo)
            
            // Update the selectedIndexPathTableViewOne
            selectedIndexPathTableViewOne = indexPath
            
            // Toggle the button selection of the selected cell
            toggleButtonSelection(for: tableViewOne, at: indexPath)
            
            // Do something with the selected cell data (if needed)
            let dataFortableViewOne = viewModel.modelArray
            let selectedData = dataFortableViewOne[indexPath.row]
            // Use selectedData as needed...
            
        } else if tableView == tableViewTwo {
            // Deselect all cells in tableViewOne
            deselectAllCells(tableView: tableViewOne)
            
            // Update the selectedIndexPathTableViewTwo
            selectedIndexPathTableViewTwo = indexPath
            
            // Toggle the button selection of the selected cell
            toggleButtonSelection(for: tableViewTwo, at: indexPath)
            
            // Do something with the selected cell data (if needed)
            let dataFortableViewTwo = viewModel.modelArray.enumerated().filter { $0.offset > 1 }.map { $0.element }
            let selectedData = dataFortableViewTwo[indexPath.row]
            // Use selectedData as needed...
        }
    }
    
    // Function to deselect all cells in the given tableView
    private func deselectAllCells(tableView: UITableView) {
        for row in 0..<tableView.numberOfRows(inSection: 0) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? MobileTopUpTableViewCell {
                cell.btn.isSelected = false
                cell.btn.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
        
        // Reset the selectedIndexPaths
        selectedIndexPathTableViewOne = nil
        selectedIndexPathTableViewTwo = nil
    }
    
    // Function to toggle the button selection state at the provided indexPath in the given tableView
    private func toggleButtonSelection(for tableView: UITableView, at indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MobileTopUpTableViewCell {
            cell.btn.isSelected.toggle()
            cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
        }
    }
    
}
