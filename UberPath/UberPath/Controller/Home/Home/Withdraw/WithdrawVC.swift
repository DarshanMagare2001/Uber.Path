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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtns()
    }
    
    @IBAction func percentageBtnPressed(_ sender: UIButton) {
        resetButtonsToDefaultState()
        sender.backgroundColor = UIColor(named: "LaunchscreenColor")
        sender.tintColor = .white
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func configureBtns(){
        applyRoundedCornerAndShadow(to: btn1)
        applyRoundedCornerAndShadow(to: btn2)
        applyRoundedCornerAndShadow(to: btn3)
        applyRoundedCornerAndShadow(to: btn4)
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
}
