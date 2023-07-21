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
    var selectedCellData: MobileTopUpTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MobileTopUpTableViewCell", bundle: nil)
        tableViewOne.register(nib, forCellReuseIdentifier: "MobileTopUpTableViewCell")
        tableViewTwo.register(nib, forCellReuseIdentifier: "MobileTopUpTableViewCell")
    }
    
    @IBAction func confirmBtnPressed(_ sender: UIButton) {
        guard let data = selectedCellData else { return }
        print(data)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func handleCellSelection(tableView: UITableView, at indexPath: IndexPath) {
        if tableView == tableViewOne {
            // Deselect the previously selected cell in tableViewOne
            if let selectedIndexPathTableViewOne = selectedIndexPathTableViewOne {
                if let cell = tableView.cellForRow(at: selectedIndexPathTableViewOne) as? MobileTopUpTableViewCell {
                    cell.btn.isSelected = false
                    cell.btn.setImage(UIImage(systemName: "circle"), for: .normal)
                }
            }
            
            // Toggle the button selection of the selected cell in tableViewOne
            if let cell = tableView.cellForRow(at: indexPath) as? MobileTopUpTableViewCell {
                cell.btn.isSelected.toggle()
                cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
            }
            
            // Update the selectedIndexPathTableViewOne
            selectedIndexPathTableViewOne = indexPath
            
            // Deselect all cells in tableViewTwo
            deselectAllCells(tableView: tableViewTwo)
            
            // Save the selected cell data in the variable
            let dataFortableViewOne = viewModel.modelArray
            selectedCellData = MobileTopUpTableViewModel(img: dataFortableViewOne[indexPath.row].img,lbl1:dataFortableViewOne[indexPath.row].lbl1 , lbl2: dataFortableViewOne[indexPath.row].lbl2)
        } else if tableView == tableViewTwo {
            // Deselect the previously selected cell in tableViewTwo
            if let selectedIndexPathTableViewTwo = selectedIndexPathTableViewTwo {
                if let cell = tableView.cellForRow(at: selectedIndexPathTableViewTwo) as? MobileTopUpTableViewCell {
                    cell.btn.isSelected = false
                    cell.btn.setImage(UIImage(systemName: "circle"), for: .normal)
                }
            }
            
            // Toggle the button selection of the selected cell in tableViewTwo
            if let cell = tableView.cellForRow(at: indexPath) as? MobileTopUpTableViewCell {
                cell.btn.isSelected.toggle()
                cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
            }
            
            // Update the selectedIndexPathTableViewTwo
            selectedIndexPathTableViewTwo = indexPath
            
            // Deselect all cells in tableViewOne
            deselectAllCells(tableView: tableViewOne)
            
            // Save the selected cell data in the variable
            let dataFortableViewTwo = viewModel.modelArray.enumerated().filter { $0.offset > 1 }.map { $0.element }
            selectedCellData = MobileTopUpTableViewModel(img: dataFortableViewTwo[indexPath.row].img,lbl1:dataFortableViewTwo[indexPath.row].lbl1 , lbl2: dataFortableViewTwo[indexPath.row].lbl2)
        }
        
    }
    
    private func deselectAllCells(tableView: UITableView) {
        for row in 0..<tableView.numberOfRows(inSection: 0) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? MobileTopUpTableViewCell {
                cell.btn.isSelected = false
                cell.btn.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
}



extension MobileTopUpVC: UITableViewDelegate, UITableViewDataSource {
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
            cell.btn.isSelected = (indexPath == selectedIndexPathTableViewOne)
            cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
            cell.selectionStyle = .none // Clear selection color
            if let image = UIImage(systemName: "checkmark.circle.fill") {
                let greenColor = UIColor(named: "LaunchscreenColor") ?? .green // Fallback to green if LaunchscreenColor is not found
                let coloredImage = image.colored(greenColor)
                cell.btn.setImage(coloredImage, for: .selected) // Set green-colored image for selected state
            }
            return cell
        }
        
        if tableView == tableViewTwo {
            cell.img.image = UIImage(named: dataFortableViewTwo[indexPath.row].img)
            cell.lbl1.text = dataFortableViewTwo[indexPath.row].lbl1
            cell.lbl2.text = dataFortableViewTwo[indexPath.row].lbl2
            cell.btn.isSelected = (indexPath == selectedIndexPathTableViewTwo)
            cell.btn.setImage(UIImage(systemName: cell.btn.isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
            cell.selectionStyle = .none // Clear selection color
            if let image = UIImage(systemName: "checkmark.circle.fill") {
                let greenColor = UIColor(named: "LaunchscreenColor") ?? .green // Fallback to green if LaunchscreenColor is not found
                let coloredImage = image.colored(greenColor)
                cell.btn.setImage(coloredImage, for: .selected) // Set green-colored image for selected state
            }
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleCellSelection(tableView: tableView, at: indexPath)
    }
}

extension UIImage {
    func colored(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = cgImage else { return nil }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: rect, mask: cgImage)
        color.setFill()
        context.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
}
