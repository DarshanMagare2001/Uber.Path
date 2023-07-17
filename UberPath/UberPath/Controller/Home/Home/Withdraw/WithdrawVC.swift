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
        btn1.applyRoundedCornerAndShadow()
        btn2.applyRoundedCornerAndShadow()
        btn3.applyRoundedCornerAndShadow()
        btn4.applyRoundedCornerAndShadow()
        
    }
    
    @IBAction func percentageBtnPressed(_ sender: UIButton) {
        // Reset all buttons to their default state
        let color = UIColor(named: "LaunchscreenColor")
        btn1.backgroundColor = .systemGray6
        btn1.tintColor = .black
        btn2.backgroundColor = .systemGray6
        btn2.tintColor = .black
        btn3.backgroundColor = .systemGray6
        btn3.tintColor = .black
        btn4.backgroundColor = .systemGray6
        btn4.tintColor = .black
        // Set the tapped button's background color to green
        sender.backgroundColor = color
        sender.tintColor = .white
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension UIButton {
    func applyRoundedCornerAndShadow() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
    }
}
