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
    @IBOutlet weak var onboardTwoViewLbl1: UILabel!
    @IBOutlet weak var onboardTwoViewLbl2: UILabel!
    
    var viewModel : FontManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        onboardingOneView.isHidden = false
        onboardingTwoView.isHidden = true
        updateFont()
        
    }
    
    @IBAction func onboardingOneViewNxtBtnPressed(_ sender: UIButton) {
        onboardingTwoView.isHidden = false
        onboardingOneView.isHidden = true
    }
    
    @IBAction func onboardingTwoViewGetstartedBtnPressed(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        navigationController?.pushViewController(destinationVC, animated: true);
    }
    
    
    @IBAction func skipBtnPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        navigationController?.pushViewController(destinationVC, animated: true);
        
    }
    
    
    
    func updateFont(){
        onboardOneViewLbl1.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        onboardOneViewLbl2.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 6.0))
        onboardTwoViewLbl1.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 17.0))
        onboardTwoViewLbl2.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 6.0))
    }
    
}

