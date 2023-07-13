//
//  ProfileVCCell.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class ProfileVCCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var divider: UIView!
    
    var buttonAction: (() -> Void)? // Closure for button action
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Add target action to the button
        forwardBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Button action handler
    @objc func buttonTapped() {
        buttonAction?() // Invoke the closure
    }
}

enum ProfileCell: Int, CaseIterable {
    case referralCode
    case accountInfo
    case contactList
    case language
    case generalSetting
    case changePassword
    case changeLogInPin
    case FAQs
    case rateUs
    case addFingerprint
    
    var title: String {
        switch self {
        case .referralCode:
            return "Referral Code"
        case .accountInfo:
            return "Account Info"
        case .contactList:
            return "Contact List"
        case .language:
            return "Language"
        case .generalSetting:
            return "General Setting"
        case .changePassword:
            return "Change Password"
        case .changeLogInPin:
            return "Change Log In PIN"
        case .FAQs:
            return "FAQs"
        case .rateUs:
            return "Rate Us"
        case .addFingerprint:
            return "Add Fingerprint"
            
        }
    }
    
    var viewController: UIViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let storyboardForMain = UIStoryboard(name: "Main", bundle: nil)
        switch self {
        case .referralCode:
            return storyboard.instantiateViewController(withIdentifier: "ReferralCodeVC") as! ReferralCodeVC
        case .accountInfo:
            return storyboard.instantiateViewController(withIdentifier: "AccountInfoVC") as! AccountInfoVC
        case .contactList:
            return storyboard.instantiateViewController(withIdentifier: "ContactListVC") as! ContactListVC
        case .language:
            return storyboard.instantiateViewController(withIdentifier: "LanguageVC") as! LanguageVC
        case .generalSetting:
            return storyboard.instantiateViewController(withIdentifier: "GeneralSettingVC") as! GeneralSettingVC
        case .changePassword:
            return storyboardForMain.instantiateViewController(withIdentifier: "OTPAuthenticationVC") as! OTPAuthenticationVC
        case .changeLogInPin:
            return storyboard.instantiateViewController(withIdentifier: "ChangeLogInPinVC") as! ChangeLogInPinVC
        case .FAQs:
            return storyboard.instantiateViewController(withIdentifier: "FAQsVC") as! FAQsVC
        case .rateUs:
            return storyboard.instantiateViewController(withIdentifier: "RateUsVC") as! RateUsVC
        case .addFingerprint:
            return storyboard.instantiateViewController(withIdentifier: "AddFingerPrintVC") as! AddFingerPrintVC
        }
    }
}
