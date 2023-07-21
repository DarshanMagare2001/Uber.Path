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
    
    @IBAction func moneyBtnPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            amountTxtFld.text = String(5)
        } else if sender.tag == 2 {
            amountTxtFld.text = String(10)
        } else if sender.tag == 3 {
            amountTxtFld.text = String(15)
        } else if sender.tag == 4 {
            amountTxtFld.text = String(20)
        } else if sender.tag == 5 {
            amountTxtFld.text = String(50)
        } else if sender.tag == 6 {
            amountTxtFld.text = String(100)
        } else if sender.tag == 7 {
            amountTxtFld.text = String(200)
        } else if sender.tag == 8 {
            amountTxtFld.text = String(500)
        }
    }
  
    func update(){
        guard let data = model else {return}
        img.image = UIImage(named: data.img)
        lbl1.text = data.lbl1
        lbl2.text = data.lbl2
    }
}
