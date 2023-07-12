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
    @IBOutlet weak var searchTxtFld: UITextField!
    var viewModel = CountryModel()
    let countryKit = CountryKit()
    var countriesArray = [Country]()
    var filteredCountriesArray = [Country]()
    var tappedButtonIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesArray = countryKit.countries
        filteredCountriesArray = countriesArray
        tableViewOutlet.reloadData()
        searchTxtFld.addTarget(self, action: #selector(searchTextDidChange), for: .editingChanged)
        searchTxtFld.placeholder = "Search"
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        searchTxtFld.resignFirstResponder()
    }
    
    @objc func searchTextDidChange() {
        if let searchText = searchTxtFld.text, !searchText.isEmpty {
            filteredCountriesArray = countriesArray.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredCountriesArray = countriesArray
        }
        
        tableViewOutlet.reloadData()
    }
    
}

extension LanguageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageVCCell", for: indexPath) as! LanguageVCCell
        let country = filteredCountriesArray[indexPath.row]
        
        if let flagImage = country.flagImage {
            cell.countryImage.image = flagImage
        } else {
            cell.countryImage.image = UIImage(named: "defaultFlag")
        }
        
        cell.countryName.text = country.name
        
        let language = CountryModel().countryLanguages[country.name] ?? ""
        cell.countryLanguageLbl.text = language
        
        // Update button appearance based on selection
        if let tappedButtonIndex = tappedButtonIndex, indexPath.row == tappedButtonIndex {
            cell.cellBtn.isSelected = true
        } else {
            cell.cellBtn.isSelected = false
        }
        
        // Set the buttonTapAction closure
        cell.buttonTapAction = { [weak self] in
            self?.tappedButtonIndex = indexPath.row
            tableView.reloadData()
        }
        
        return cell
    }
}

