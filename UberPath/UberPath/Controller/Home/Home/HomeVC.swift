//
//  HomeVC.swift
//  UberPath
//
//  Created by IPS-161 on 03/07/23.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    var viewModel = AuthenticationModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateCard()
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        viewModel.logout()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @IBAction func depositBtnPressed(_ sender: Any) {
        print("Deposit")
    }
   
    @IBAction func transfersBtnPressed(_ sender: UIButton) {
        print("Done")
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransfersVC") as! TransfersVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func withdrawBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "WithdrawVC") as! WithdrawVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func moreBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func allTransactionBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "HistoryTrasactionVC") as! HistoryTrasactionVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateFont(){
        welcomeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        nameLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    func updateCard(){
        if let selectedImageName = UserDefaults.standard.string(forKey: "SelectedImageName") {
            cardImage.image = UIImage(named:selectedImageName)
        }
    }
    
}
