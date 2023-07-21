//
//  BottomSheetVC.swift
//  UberPath
//
//  Created by IPS-161 on 21/07/23.
//

import UIKit

class BottomSheetVC: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    var model : MobileTopUpTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    func update(){
        guard let data = model else {return}
        img.image = UIImage(named: data.img)
        lbl1.text = data.lbl1
        lbl2.text = data.lbl2
    }
}
