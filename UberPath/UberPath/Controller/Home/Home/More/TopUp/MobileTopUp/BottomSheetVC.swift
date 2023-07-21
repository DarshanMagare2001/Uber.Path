//
//  BottomSheetVC.swift
//  UberPath
//
//  Created by IPS-161 on 21/07/23.
//

import UIKit


class BottomSheetVC: UIViewController ,UITextFieldDelegate {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var amountTxtFld: UITextField!
    @IBOutlet weak var slide: UISlider!
    @IBOutlet var moneyButtons: [UIButton]! // Outlet collection for the money buttons
    var model: MobileTopUpTableViewModel?
    var amountForProcess : Int = 0
    var delegate : popToRootVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        slide.minimumValue = 1 // Set the slider's minimum value to 1 (representing 1x)
        slide.maximumValue = 10
        amountTxtFld.delegate = self
    }
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        if let currentAmount = Int(amountTxtFld.text ?? "0") {
            // Subtract 1 from the current amount and ensure it's not negative
            let newAmount = max(0, currentAmount - 1)
            amountTxtFld.text = String(newAmount)
            amountForProcess = newAmount
            slide.value = 0
        }
    }
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        if let currentAmount = Int(amountTxtFld.text ?? "0") {
            // Add 1 to the current amount
            let newAmount = currentAmount + 1
            amountTxtFld.text = String(newAmount)
            amountForProcess = newAmount
            slide.value = 0
        }
    }
    
    @IBAction func moneyBtnPressed(_ sender: UIButton) {
        let amounts = [5, 10, 15, 20, 50, 100, 200, 500]
        
        if let index = moneyButtons.firstIndex(of: sender) {
            if index < amounts.count {
                let amount = amounts[index]
                amountTxtFld.text = String(amount)
                amountForProcess = amount
                slide.value = 0
            }
            
            // Update the appearance of the money buttons
            updateMoneyButtonsAppearance(selectedButton: sender)
        }
    }
    
    @IBAction func slideValueChanged(_ sender: UISlider) {
        // Get the current value of the slider (ranging from 0 to 100)
        let currentValue = Int(sender.value)
        // Calculate the new amount based on the percentage of the slider value
        let newAmount = Int(amountForProcess * currentValue)
        print(newAmount)
        amountTxtFld.text = String(newAmount)
    }
    
    
    @IBAction func topUpBtnPressed(_ sender: UIButton) {
        if amountTxtFld.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Amount Required", message: "Please select an amount first.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        } else {
            if let amount = Int(amountTxtFld.text!) {
                let alert = UIAlertController(title: "TopUp Successful", message: "Your top-up worth $\(amount) was successful!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    alert.dismiss(animated: true, completion: nil)
                    self.dismiss(animated: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.delegate?.popToRootVC(pop: true)
                    }
                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                
            } else {
                // Show an alert if the entered amount cannot be converted to an integer
                let alert = UIAlertController(title: "Invalid Amount", message: "Please enter a valid amount.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    alert.dismiss(animated: true, completion: nil)
                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let currentAmount = Int(amountTxtFld.text ?? "0") {
            slide.value = 0
            amountForProcess = currentAmount
        }
    }
    
    
    func update() {
        let thumbImage = UIImage(named: "ThumbImage")
        slide.setThumbImage(thumbImage, for: .normal)
        guard let data = model else { return }
        img.image = UIImage(named: data.img)
        lbl1.text = data.lbl1
        lbl2.text = data.lbl2
    }
    
    func updateMoneyButtonsAppearance(selectedButton: UIButton) {
        for button in moneyButtons {
            if button == selectedButton {
                // Set the selected button appearance
                button.backgroundColor = UIColor(named: "LaunchscreenColor")
                button.tintColor = .white
            } else {
                // Set the normal appearance for other buttons
                button.backgroundColor = .systemGray6
                button.tintColor = UIColor(named: "GlobalButtonColor")
            }
        }
    }
}
