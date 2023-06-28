//
//  ReasonsVC.swift
//  UberPath
//
//  Created by IPS-161 on 27/06/23.
//

import UIKit

class ReasonsVC: UIViewController {
    @IBOutlet weak var mainReasonLbl: UILabel!
    @IBOutlet weak var weNeedlbl: UILabel!
    @IBOutlet weak var spendLbl: UILabel!
    @IBOutlet weak var fastLbl: UILabel!
    @IBOutlet weak var paymentsLbl: UILabel!
    @IBOutlet weak var onlinePaymentLbl: UILabel!
    @IBOutlet weak var spendWhileLbl: UILabel!
    @IBOutlet weak var yourLbl: UILabel!
    
    @IBOutlet weak var spendView: UIView!
    @IBOutlet weak var fastView: UIView!
    @IBOutlet weak var paymentsView: UIView!
    @IBOutlet weak var onlinePaymentView: UIView!
    @IBOutlet weak var spendWhileView: UIView!
    @IBOutlet weak var yourView: UIView!
    var isViewSelected: [UIView: Bool] = [:]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        setupTapGestureRecognizers()
    }
    
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    func updateFont(){
        mainReasonLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        weNeedlbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        spendLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        fastLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        paymentsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        onlinePaymentLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        spendWhileLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
        yourLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 12.0))
    }
    
    private func setupTapGestureRecognizers() {
        let views: [UIView] = [spendView, fastView, paymentsView, onlinePaymentView, spendWhileView, yourView]
        
        for view in views {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGestureRecognizer)
            isViewSelected[view] = false
        }
    }
    
    @objc private func viewTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let view = gestureRecognizer.view else { return }
        
        let isSelected = isViewSelected[view] ?? false
        isViewSelected[view] = !isSelected
        
        if isSelected {
            view.backgroundColor = .white
            
            switch view {
            case spendView:
                spendLbl.textColor = .black
            case fastView:
                fastLbl.textColor = .black
            case paymentsView:
                paymentsLbl.textColor = .black
            case onlinePaymentView:
                onlinePaymentLbl.textColor = .black
            case spendWhileView:
                spendWhileLbl.textColor = .black
            case yourView:
                yourLbl.textColor = .black
            default:
                break
            }
        } else {
            let greenColor = UIColor(named: "LaunchscreenColor")
            view.backgroundColor = greenColor
            
            switch view {
            case spendView:
                spendLbl.textColor = .white
            case fastView:
                fastLbl.textColor = .white
            case paymentsView:
                paymentsLbl.textColor = .white
            case onlinePaymentView:
                onlinePaymentLbl.textColor = .white
            case spendWhileView:
                spendWhileLbl.textColor = .white
            case yourView:
                yourLbl.textColor = .white
            default:
                break
            }
        }
    }
    
    
    
    
    
}
