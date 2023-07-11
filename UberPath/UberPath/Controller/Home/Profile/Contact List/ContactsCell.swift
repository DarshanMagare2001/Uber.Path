//
//  ContactsCell.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import UIKit

class ContactsCell: UITableViewCell {
    @IBOutlet weak var userImage: CircleImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

struct cellModel {
    var name : String?
    var phoneNumber : String?
}

class cellData {
    let dataArray = [cellModel(name: "Linda John", phoneNumber: "**** **** **** 2564"),cellModel(name: "David William", phoneNumber: "**** **** **** 3256"),cellModel(name: "Susan Charles", phoneNumber: "**** **** **** 3125"),cellModel(name: "Sarah Sam", phoneNumber: "**** **** **** 8745"),cellModel(name: "Monica Jess", phoneNumber: "**** **** **** 0122"),cellModel(name: "Loran Hailey", phoneNumber: "**** **** **** 3666")]
    
}
