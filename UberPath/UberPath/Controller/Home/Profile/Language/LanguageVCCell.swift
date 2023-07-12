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
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
