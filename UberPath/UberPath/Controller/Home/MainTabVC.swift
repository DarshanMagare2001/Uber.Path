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
    
    enum Tab {
        case home
        case myCard
        case activity
        case profile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(scanBtnViewTapped))
        scanBtnView.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI(for: .home)
        showTab(.home)
    }
    
    @objc func scanBtnViewTapped() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ScanQRCodeVC") as! ScanQRCodeVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
   
    @IBAction func tabBtnPressed(_ sender: UIButton) {
        let tag = sender.tag
        print(tag)
        var selectedTab: Tab?
        
        switch tag {
        case 1:
            selectedTab = .home
        case 2:
            selectedTab = .myCard
        case 3:
            selectedTab = .activity
        case 4:
            selectedTab = .profile
        default:
            break
        }
        
        guard let tab = selectedTab else {
            return
        }
        
        updateUI(for: tab)
        showTab(tab)
    }
    
    func updateUI(for tab: Tab) {
        homeBtnLbl.textColor = tab == .home ? UIColor(named: "LaunchscreenColor") : UIColor(named: "GlobalButtonColor")
        homeBtn.tintColor = tab == .home ? UIColor(named: "LaunchscreenColor") : UIColor.lightGray
        myCardBtnLbl.textColor = tab == .myCard ? UIColor(named: "LaunchscreenColor") : UIColor(named: "GlobalButtonColor")
        myCardBtn.tintColor = tab == .myCard ? UIColor(named: "LaunchscreenColor") : UIColor.lightGray
        activityBtnLbl.textColor = tab == .activity ? UIColor(named: "LaunchscreenColor") : UIColor(named: "GlobalButtonColor")
        activityBtn.tintColor = tab == .activity ? UIColor(named: "LaunchscreenColor") : UIColor.lightGray
        profileBtnLbl.textColor = tab == .profile ? UIColor(named: "LaunchscreenColor") : UIColor(named: "GlobalButtonColor")
        profileBtn.tintColor = tab == .profile ? UIColor(named: "LaunchscreenColor") : UIColor.lightGray
    }
    
    
    func showTab(_ tab: Tab) {
        var destinationVC: UIViewController?
        
        switch tab {
        case .home:
            destinationVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        case .myCard:
            destinationVC = storyboard?.instantiateViewController(withIdentifier: "MyCardVC") as? MyCardVC
        case .activity:
            destinationVC = storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as? ActivityVC
        case .profile:
            destinationVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        }
        
        if let destinationVC = destinationVC {
            destinationVC.view.frame = mainContentView.bounds
            mainContentView.addSubview(destinationVC.view)
        }
    }

    
    func showHome() {
        showTab(.home)
        updateUI(for: .home)
    }
    
}

