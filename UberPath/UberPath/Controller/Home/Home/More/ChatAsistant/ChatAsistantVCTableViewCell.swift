//
//  ChatAsistantVCTableViewCell.swift
//  UberPath
//
//  Created by IPS-161 on 19/07/23.
//

import UIKit

class ChatAsistantVCTableViewCell: UITableViewCell {
    @IBOutlet weak var msgView: UIView!
    @IBOutlet weak var msgLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
