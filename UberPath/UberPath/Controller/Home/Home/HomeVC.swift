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
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        updateCard()
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
        print("withdrawBtnPressed")
    }
    
    
    @IBAction func moreBtnPressed(_ sender: UIButton) {
        print("moreBtnPressed")
    }
    
    
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
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
