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
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        v1.isHidden = false
        v2.isHidden = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
