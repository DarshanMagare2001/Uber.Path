//
//  WithdrawVC.swift
//  UberPath
//
//  Created by IPS-161 on 17/07/23.
//

import UIKit

class WithdrawVC: UIViewController {
    @IBOutlet weak var btn1: RoundedButtonWithBorder!
    @IBOutlet weak var btn2: RoundedButtonWithBorder!
    @IBOutlet weak var btn3: RoundedButtonWithBorder!
    @IBOutlet weak var btn4: RoundedButtonWithBorder!
    @IBOutlet weak var amounttxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtns()
        selectButton(btn4)
    }
    
    @IBAction func percentageBtnPressed(_ sender: UIButton) {
        resetButtonsToDefaultState()
        sender.backgroundColor = UIColor(named: "LaunchscreenColor")
        sender.tintColor = .white
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectBankBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SelectBankWithdrawVC") as! SelectBankWithdrawVC
        present(destinationVC, animated: true, completion: nil)
    }
    
    func configureBtns() {
        applyRoundedCornerAndShadow(to: btn1)
        applyRoundedCornerAndShadow(to: btn2)
        applyRoundedCornerAndShadow(to: btn3)
        applyRoundedCornerAndShadow(to: btn4)
        amounttxtFld.placeholder = "Enter Amount"
    }
    
    func applyRoundedCornerAndShadow(to button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
    }
    
    func resetButtonsToDefaultState() {
        let defaultColor = UIColor.systemGray6
        let defaultTintColor = UIColor.black
        
        [btn1, btn2, btn3, btn4].forEach { button in
            button?.backgroundColor = defaultColor
            button?.tintColor = defaultTintColor
        }
    }
    
    func selectButton(_ button: UIButton) {
        button.backgroundColor = UIColor(named: "LaunchscreenColor")
        button.tintColor = .white
    }
}
