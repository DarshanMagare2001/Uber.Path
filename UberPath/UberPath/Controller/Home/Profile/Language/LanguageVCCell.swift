//
//  LanguageVCCell.swift
//  UberPath
//
//  Created by IPS-161 on 12/07/23.
//

import UIKit

class LanguageVCCell: UITableViewCell {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryLanguageLbl: UILabel!
    @IBOutlet weak var cellBtn: UIButton!
    
    var buttonTapAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set initial button image
        cellBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        cellBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        
        // Add button action
        cellBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc private func buttonTapped() {
        cellBtn.isSelected.toggle()
        buttonTapAction?()
    }
}
