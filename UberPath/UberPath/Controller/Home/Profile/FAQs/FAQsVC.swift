//
//  FAQsVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class FAQsVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var searchTxtFld: UITextField!
    var viewModel = cellModelDataForFAQsVCCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTxtFld.placeholder = "Search"
        
    }
    
    @IBAction func loadMoreBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension FAQsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        cell.lbl1.text = viewModel.cellDataArray[indexPath.row].question
        cell.lbl2.text = viewModel.cellDataArray[indexPath.row].ans
        return cell
    }
    
}
