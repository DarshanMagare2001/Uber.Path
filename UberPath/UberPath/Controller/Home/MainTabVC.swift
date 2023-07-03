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
    override func viewDidLoad() {
        super.viewDidLoad()
        showHome()
    }
    
    @IBAction func tabBtnPressed(_ sender: UIButton) {
        let tag = sender.tag
        print(tag)
        if tag == 1{
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 2{
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "MyCardVC") as? MyCardVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 3{
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ActivityVC") as? ActivityVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }else if tag == 4{
            guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else { return }
            mainContentView.addSubview(destinationVC.view)
        }
        
    }
    
    func showHome(){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
        mainContentView.addSubview(destinationVC.view)
    }
    
}
