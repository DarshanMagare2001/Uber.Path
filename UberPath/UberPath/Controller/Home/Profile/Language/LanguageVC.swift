//
//  LanguageVC.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit
import CountryKit

class LanguageVC: UIViewController {
    @IBOutlet weak var tableViewOutlet: UITableView!
    let countryKit = CountryKit()
    var countriesArray = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesArray = countryKit.countries
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension LanguageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageVCCell", for: indexPath) as! LanguageVCCell
        let country = countriesArray[indexPath.row]
        
        if let flagImage = country.flagImage {
            cell.cellImage.image = flagImage
        } else {
            cell.cellImage.image = UIImage(named: "defaultFlag")
        }
        
        cell.cellLbl.text = country.name
        return cell
    }
}

