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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func currencySymbolShowBtnPressed(_ sender: UIButton) {
        // Handle the button tap action here
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        // Change the background color to green
        if let tappedLabel = sender.view as? UILabel {
            tappedLabel.backgroundColor = UIColor.green
            
            // Add shadow effect
            tappedLabel.layer.shadowColor = UIColor.black.cgColor
            tappedLabel.layer.shadowOpacity = 0.5
            tappedLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
            tappedLabel.layer.shadowRadius = 4
            tappedLabel.layer.shadowPath = UIBezierPath(roundedRect: tappedLabel.bounds, cornerRadius: tappedLabel.layer.cornerRadius).cgPath
        }
    }
}
