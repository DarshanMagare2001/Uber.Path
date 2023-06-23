//
//  ViewController.swift
//  UberPath
//
//  Created by IPS-161 on 22/06/23.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var onboardingOneView: UIView!
    
    @IBOutlet weak var onboardingTwoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingOneView.isHidden = false
        onboardingTwoView.isHidden = true

    }
    
    
    @IBAction func onboardingOneViewNxtBtnPressed(_ sender: UIButton) {
        onboardingTwoView.isHidden = false
        onboardingOneView.isHidden = true
        
    }
    
    
    
    @IBAction func onboardingTwoViewGetstartedBtnPressed(_ sender: UIButton) {
        
        
        
    }
    

}

