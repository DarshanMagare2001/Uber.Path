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
    
    @IBOutlet weak var spendImageView: UIImageView!
    @IBOutlet weak var fastImageView: UIImageView!
    @IBOutlet weak var paymentsImageView: UIImageView!
    @IBOutlet weak var onlinePaymentImageView: UIImageView!
    @IBOutlet weak var spendWhileImageView: UIImageView!
    @IBOutlet weak var yourImageView: UIImageView!
    
    
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
                spendImageView.tintColor = .black
            case fastView:
                fastLbl.textColor = .black
                fastImageView.tintColor = .black
            case paymentsView:
                paymentsLbl.textColor = .black
                paymentsImageView.tintColor = .black
            case onlinePaymentView:
                onlinePaymentLbl.textColor = .black
                onlinePaymentImageView.tintColor = .black
            case spendWhileView:
                spendWhileLbl.textColor = .black
                spendWhileImageView.tintColor = .black
            case yourView:
                yourLbl.textColor = .black
                yourImageView.tintColor = .black
            default:
                break
            }
        } else {
            let greenColor = UIColor(named: "LaunchscreenColor")
            view.backgroundColor = greenColor
            
            switch view {
            case spendView:
                spendLbl.textColor = .white
                spendImageView.tintColor = .white
            case fastView:
                fastLbl.textColor = .white
                fastImageView.tintColor = .white
            case paymentsView:
                paymentsLbl.textColor = .white
                paymentsImageView.tintColor = .white
            case onlinePaymentView:
                onlinePaymentLbl.textColor = .white
                onlinePaymentImageView.tintColor = .white
            case spendWhileView:
                spendWhileLbl.textColor = .white
                spendWhileImageView.tintColor = .white
            case yourView:
                yourLbl.textColor = .white
                yourImageView.tintColor = .white
            default:
                break
            }
        }
    }
    
    
    
    
    
}
