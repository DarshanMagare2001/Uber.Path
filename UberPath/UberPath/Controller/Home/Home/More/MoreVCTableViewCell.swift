//
//  MoreVCTableViewCell.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class MoreVCTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    var buttonTapHandler: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped() {
        // Call the closure when the button is tapped
        buttonTapHandler?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

enum CellType: Int {
    case atmFinder
    case chatAssistant
    case topUp
    
    var viewControllerIdentifier: String {
        switch self {
        case .atmFinder: return "ATMFinderVC"
        case .chatAssistant: return "ChatAsistantVC"
        case .topUp: return "TopUpVC"
        }
    }
    // Add an initializer to make the enum instantiable from an integer value (rawValue)
    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .atmFinder
        case 1: self = .chatAssistant
        case 2: self = .topUp
        default: return nil
        }
    }
}
