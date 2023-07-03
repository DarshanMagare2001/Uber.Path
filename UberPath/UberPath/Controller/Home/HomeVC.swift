//
//  HomeVC.swift
//  UberPath
//
//  Created by IPS-161 on 30/06/23.
//

import UIKit

class HomeVC: UIViewController {
var viewModel = AuthenticationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.logout()
    }
    

    

}
