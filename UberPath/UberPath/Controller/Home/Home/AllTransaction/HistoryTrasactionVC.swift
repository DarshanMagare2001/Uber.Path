//
//  HistoryTrasactionVC.swift
//  UberPath
//
//  Created by IPS-161 on 18/07/23.
//

import UIKit

class HistoryTrasactionVC: UIViewController {
    @IBOutlet weak var amountShowLblView: UIView!
    @IBOutlet weak var amountHideShowBtn: UIButton!
    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var tableViewTwo: UITableView!
    var isAmountShow = true
    var viewModel = TableViewModelClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        amountShowLblView.isHidden = false
        let nib = UINib(nibName: "TableViewCellForOneAndTwo", bundle: nil)
        tableViewOne.register(nib, forCellReuseIdentifier: "TableViewCellForOneAndTwo")
        tableViewTwo.register(nib, forCellReuseIdentifier: "TableViewCellForOneAndTwo")
    }
    
    @IBAction func amountHideShowBtnPressed(_ sender: UIButton) {
        amountShowLblView.isHidden.toggle()
        isAmountShow.toggle()
        if isAmountShow {
            let image = UIImage(systemName: "eye")
            amountHideShowBtn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            amountHideShowBtn.setImage(image, for: .normal)
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension HistoryTrasactionVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewOne {
            return 3
        }
        if tableView == tableViewTwo {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewOne {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForOneAndTwo", for: indexPath) as! TableViewCellForOneAndTwo
            cell.img.image = UIImage(named: viewModel.TableViewModelClassArray[indexPath.row].img)
            cell.lbl1.text = viewModel.TableViewModelClassArray[indexPath.row].lbl1
            cell.lbl2.text = viewModel.TableViewModelClassArray[indexPath.row].lbl2
            cell.lbl3.text = viewModel.TableViewModelClassArray[indexPath.row].lbl3
            return cell
        }
        if tableView == tableViewTwo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForOneAndTwo", for: indexPath) as! TableViewCellForOneAndTwo
            cell.img.image = UIImage(named: viewModel.TableViewModelClassArray[indexPath.row].img)
            cell.lbl1.text = viewModel.TableViewModelClassArray[indexPath.row].lbl1
            cell.lbl2.text = viewModel.TableViewModelClassArray[indexPath.row].lbl2
            cell.lbl3.text = viewModel.TableViewModelClassArray[indexPath.row].lbl3
            return cell
        }
        
        return UITableViewCell()
    }
}
