//
//  HomeVC.swift
//  UberPath
//
//  Created by IPS-161 on 30/06/23.
//

import UIKit

class MainTabVC: UIViewController {
    var viewModel = AuthenticationModel()
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var homeBtnLbl: UILabel!
    @IBOutlet weak var myCardBtn: UIButton!
    @IBOutlet weak var myCardBtnLbl: UILabel!
    @IBOutlet weak var scanBtnView: CircleView!
    @IBOutlet weak var activityBtn: UIButton!
    @IBOutlet weak var activityBtnLbl: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var profileBtnLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHome()
    }
    
    @IBAction func tabBtnPressed(_ sender: UIButton) {
        let tag = sender.tag
        print(tag)
        if tag == 1{
            homeBtn.tintColor = UIColor(named: "LaunchscreenColor")
            homeBtnLbl.textColor = UIColor(named: "LaunchscreenColor")
            myCardBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            activityBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            profileBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 2{
            homeBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            myCardBtnLbl.textColor = UIColor(named: "LaunchscreenColor")
            activityBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            profileBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "MyCardVC") as? MyCardVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 3{
            homeBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            myCardBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            activityBtnLbl.textColor = UIColor(named: "LaunchscreenColor")
            profileBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as? ActivityVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 4{
            homeBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            myCardBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            activityBtnLbl.textColor = UIColor(named: "GlobalButtonColor")
            profileBtnLbl.textColor = UIColor(named: "LaunchscreenColor")
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }
        
    }
    
    func showHome(){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
        mainContentView.addSubview(destinationVC.view)
    }
    
}
