//
//  TransferDetailVC.swift
//  UberPath
//
//  Created by IPS-161 on 06/07/23.
//

import UIKit
import nanopb

class TransferDetailVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var currencyPickerView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var currencyShowLbl: UILabel!
    @IBOutlet weak var currencyTxtFld: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyPickerBtn: UIButton!
    @IBOutlet weak var popUpView: UIView!
    var viewModel = Model()
    var isShow = false
    var userImageName : String?
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserImage()
        currencyPickerView.isHidden = true
        popUpView.isHidden = true
        addDoneButtonToCurrencyTextField()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popUpViewTapped))
        popUpView.addGestureRecognizer(tapGesture)
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        popUpView.isHidden = true
    }
    
    @IBAction func okBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransferSuccessfulVC") as! TransferSuccessfulVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func currencyPickerBtnPressed(_ sender: UIButton) {
        isShow.toggle()
        currencyPickerView.isHidden.toggle()
        if isShow {
            currencyPickerBtn.setImage(UIImage(named: "DownArrow"), for: .normal)
        }else {
            currencyPickerBtn.setImage(UIImage(named: "ForwardArrow"), for: .normal)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendMoneyBtnPressed(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @objc private func popUpViewTapped() {
        popUpView.isHidden = true
    }
    
    private func addDoneButtonToCurrencyTextField() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        
        toolbar.items = [flexibleSpace, doneButton]
        currencyTxtFld.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonPressed() {
        currencyTxtFld.resignFirstResponder()
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.currencyDictionary.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let currencyCodes = Array(viewModel.currencyDictionary.keys).sorted()
        return currencyCodes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencyCodes = Array(viewModel.currencyDictionary.keys).sorted()
        let selectedCurrency = currencyCodes[row]
        let selectedCountry = viewModel.currencyDictionary[selectedCurrency]
        currencyShowLbl.text = selectedCountry
    }
    
    func updateUserImage(){
        guard let image = userImageName else {return}
        userImageView.image = UIImage(named: image)
        guard let text = userName else {return}
        userNameLbl.text = text
    }
    
}
