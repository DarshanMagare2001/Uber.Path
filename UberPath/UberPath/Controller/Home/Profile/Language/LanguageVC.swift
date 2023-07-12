//
//  LanguageVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit
import ADCountryPicker

class LanguageVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension LanguageVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageVCCell", for: indexPath) as! LanguageVCCell
        return cell
        
    }
    
    
}
