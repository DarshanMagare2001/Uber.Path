//
//  BottomSheetVC.swift
//  UberPath
//
//  Created by IPS-161 on 21/07/23.
//

import UIKit

class BottomSheetVC: UIViewController {
    var model : MobileTopUpTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = model else { return }
        print(data)
    }
     
}
