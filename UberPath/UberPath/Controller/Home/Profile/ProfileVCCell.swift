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
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
