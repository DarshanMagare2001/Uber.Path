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
    @IBOutlet weak var amountTxtFld: UITextField!
    @IBOutlet weak var slide: UISlider!
  
    
    
    
    
    
    
    
    var model : MobileTopUpTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    @IBAction func minusBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func plusBtnPressed(_ sender: UIButton) {
    }
    
    
    
    func update(){
        guard let data = model else {return}
        img.image = UIImage(named: data.img)
        lbl1.text = data.lbl1
        lbl2.text = data.lbl2
    }
}
