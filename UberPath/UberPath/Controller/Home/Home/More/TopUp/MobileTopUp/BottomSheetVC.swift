//
//  BottomSheetVC.swift
//  UberPath
//
//  Created by IPS-161 on 21/07/23.
//

import UIKit

class BottomSheetVC: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var amountTxtFld: UITextField!
    @IBOutlet weak var slide: UISlider!
    
    @IBOutlet var moneyButtons: [UIButton]! // Outlet collection for the money buttons
    
    var model: MobileTopUpTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        // Handle the minus button press here if needed
    }
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
        // Handle the plus button press here if needed
    }
    
    @IBAction func moneyBtnPressed(_ sender: UIButton) {
        let amounts = [5, 10, 15, 20, 50, 100, 200, 500]
        
        if let index = moneyButtons.firstIndex(of: sender) {
            if index < amounts.count {
                let amount = amounts[index]
                amountTxtFld.text = String(amount)
            }
            
            // Update the appearance of the money buttons
            updateMoneyButtonsAppearance(selectedButton: sender)
        }
    }
    
    func update() {
        guard let data = model else { return }
        img.image = UIImage(named: data.img)
        lbl1.text = data.lbl1
        lbl2.text = data.lbl2
        
        // Set the default amount value in the text field
        amountTxtFld.text = "0"
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
