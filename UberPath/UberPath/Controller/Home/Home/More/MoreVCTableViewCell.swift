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
