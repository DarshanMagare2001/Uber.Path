//
//  CardTopUpVC.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class CardTopUpVC: UIViewController {
    @IBOutlet weak var currencySymbolBtn: UIButton!
    @IBOutlet weak var currencyShowLbl: UILabel!
    @IBOutlet weak var amountTxtFld: UITextField!
    @IBOutlet weak var currencySymbolPickerView: UIPickerView!
    @IBOutlet weak var lbl1: RoundedLabelWithBorder!
    @IBOutlet weak var lbl2: RoundedLabelWithBorder!
    @IBOutlet weak var lbl3: RoundedLabelWithBorder!
    @IBOutlet weak var currencyPicker: RoundedButtonWithBorder!
    @IBOutlet weak var cardImg: UIImageView!
    var viewModel = CurrencyModel()
    var tappedLabel: RoundedLabelWithBorder? // Keep track of the tapped label
    var isShow = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        setupCurrencyPickerView()
        labelTappedForDefaultSelection(lbl3)
        currencyPicker.isHidden = true
        updateCard()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func currencySymbolShowBtnPressed(_ sender: UIButton) {
        // Show the currencySymbolPickerView when the button is tapped
        currencySymbolPickerView.isHidden = false
        currencyPicker.isHidden.toggle()
        isShow.toggle()
        if isShow {
            currencySymbolBtn.setImage(UIImage(named: "DownArrow"), for: .normal)
        }else {
            currencySymbolBtn.setImage(UIImage(named: "ForwardArrow"), for: .normal)
        }
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if let amountText = amountTxtFld.text, let topUpBalance = Int(amountText) {
            let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "ConfirmTopUpVC") as! ConfirmTopUpVC
            destinationVC.topUpBalance = topUpBalance
            destinationVC.currencySymbol = currencyShowLbl.text
            navigationController?.pushViewController(destinationVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Invalid Amount", message: "Please enter a valid amount.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func addTapGesture() {
        // Add tap gestures to labels
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        lbl1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        lbl2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        lbl3.addGestureRecognizer(tapGesture3)
        
        // Enable user interaction for the labels to handle tap events
        lbl1.isUserInteractionEnabled = true
        lbl2.isUserInteractionEnabled = true
        lbl3.isUserInteractionEnabled = true
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        // Reset all labels
        resetAllLabels()
        
        // Change the background color to green and add shadow effect for the tapped label
        if let tappedLabel = sender.view as? RoundedLabelWithBorder {
            tappedLabel.backgroundColor = UIColor(named: "LaunchscreenColor")
            tappedLabel.textColor = .white
            tappedLabel.layer.shadowColor = UIColor.black.cgColor
            tappedLabel.layer.shadowOpacity = 0.5
            tappedLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
            tappedLabel.layer.shadowRadius = 4
            tappedLabel.layer.shadowPath = UIBezierPath(roundedRect: tappedLabel.bounds, cornerRadius: tappedLabel.layer.cornerRadius).cgPath
            
            // Update the currently tapped label
            self.tappedLabel = tappedLabel
        }
    }
    
    func resetAllLabels() {
        // Reset the background color and shadow effect for all labels
        lbl1.backgroundColor = .systemGray6
        lbl1.textColor = UIColor(named: "GlobalButtonColor")
        lbl1.layer.shadowColor = nil
        lbl1.layer.shadowOpacity = 0
        lbl1.layer.shadowOffset = CGSize.zero
        lbl1.layer.shadowRadius = 0
        
        lbl2.backgroundColor = .systemGray6
        lbl2.textColor = UIColor(named: "GlobalButtonColor")
        lbl2.layer.shadowColor = nil
        lbl2.layer.shadowOpacity = 0
        lbl2.layer.shadowOffset = CGSize.zero
        lbl2.layer.shadowRadius = 0
        
        lbl3.backgroundColor = .systemGray6
        lbl3.textColor = UIColor(named: "GlobalButtonColor")
        lbl3.layer.shadowColor = nil
        lbl3.layer.shadowOpacity = 0
        lbl3.layer.shadowOffset = CGSize.zero
        lbl3.layer.shadowRadius = 0
    }
    
    func labelTappedForDefaultSelection(_ label: RoundedLabelWithBorder) {
        // Simulate tap on the provided label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        label.addGestureRecognizer(tapGesture)
        labelTapped(tapGesture)
    }
    
    func setupCurrencyPickerView() {
        currencySymbolPickerView.delegate = self
        currencySymbolPickerView.dataSource = self
        
        // Hide the picker view initially
        currencySymbolPickerView.isHidden = true
    }
    
    func updateCard(){
        if let selectedImageName = UserDefaults.standard.string(forKey: "SelectedImageName") {
            cardImg.image = UIImage(named:selectedImageName)
        }
        amountTxtFld.placeholder = "Enter Amount"
    }
}

extension CardTopUpVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
}
