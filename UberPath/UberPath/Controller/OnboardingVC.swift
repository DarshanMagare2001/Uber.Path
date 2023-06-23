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
    @IBOutlet weak var onboardOneViewLbl1: UILabel!
    @IBOutlet weak var onboardOneViewLbl2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingOneView.isHidden = false
        onboardingTwoView.isHidden = true

        let baseFontSize: CGFloat = 17.0
        let adjustedFontSize = FontManager.adjustedFontSize(forBaseSize: baseFontSize)
        onboardOneViewLbl1.font = UIFont.systemFont(ofSize: adjustedFontSize)
        
        
        
        
    }
    
    
    @IBAction func onboardingOneViewNxtBtnPressed(_ sender: UIButton) {
        onboardingTwoView.isHidden = false
        onboardingOneView.isHidden = true
        
    }
    
    
    
    @IBAction func onboardingTwoViewGetstartedBtnPressed(_ sender: UIButton) {
        
        
        
    }
    

}

