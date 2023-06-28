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
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CreatePinVC") as! CreatePinVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
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
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                view.layer.shadowOpacity = 0.0
            }, completion: { _ in
                view.backgroundColor = .white
                view.layer.shadowColor = UIColor.clear.cgColor
                
                switch view {
                case self.spendView:
                    self.spendLbl.textColor = .black
                    self.spendImageView.tintColor = .black
                case self.fastView:
                    self.fastLbl.textColor = .black
                    self.fastImageView.tintColor = .black
                case self.paymentsView:
                    self.paymentsLbl.textColor = .black
                    self.paymentsImageView.tintColor = .black
                case self.onlinePaymentView:
                    self.onlinePaymentLbl.textColor = .black
                    self.onlinePaymentImageView.tintColor = .black
                case self.spendWhileView:
                    self.spendWhileLbl.textColor = .black
                    self.spendWhileImageView.tintColor = .black
                case self.yourView:
                    self.yourLbl.textColor = .black
                    self.yourImageView.tintColor = .black
                default:
                    break
                }
            })
        } else {
            view.backgroundColor = UIColor(named: "LaunchscreenColor")
            view.layer.cornerRadius = 8.0
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowRadius = 4.0
            
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { _ in
                switch view {
                case self.spendView:
                    self.spendLbl.textColor = .white
                    self.spendImageView.tintColor = .white
                case self.fastView:
                    self.fastLbl.textColor = .white
                    self.fastImageView.tintColor = .white
                case self.paymentsView:
                    self.paymentsLbl.textColor = .white
                    self.paymentsImageView.tintColor = .white
                case self.onlinePaymentView:
                    self.onlinePaymentLbl.textColor = .white
                    self.onlinePaymentImageView.tintColor = .white
                case self.spendWhileView:
                    self.spendWhileLbl.textColor = .white
                    self.spendWhileImageView.tintColor = .white
                case self.yourView:
                    self.yourLbl.textColor = .white
                    self.yourImageView.tintColor = .white
                default:
                    break
                }
            })
        }
    }
    
    
    
    
    
    
}
