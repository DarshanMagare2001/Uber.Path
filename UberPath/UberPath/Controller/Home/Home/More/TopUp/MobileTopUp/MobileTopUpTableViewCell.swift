//
//  MobileTopUpTableViewCell.swift
//  UberPath
//
//  Created by IPS-161 on 20/07/23.
//

import UIKit

class MobileTopUpTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var btn: UIButton!
//    var buttonTapAction: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
//        // Set initial button image
//        btn.setImage(UIImage(systemName: "circle"), for: .normal)
//        btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
//        // Add button action
//        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
//    @objc private func buttonTapped() {
//        btn.isSelected.toggle()
//        buttonTapAction?()
//    }
}
