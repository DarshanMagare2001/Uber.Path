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
