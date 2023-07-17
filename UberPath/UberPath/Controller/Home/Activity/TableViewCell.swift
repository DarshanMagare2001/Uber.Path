//
//  TableViewCell.swift
//  UberPath
//
//  Created by IPS-161 on 17/07/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl1: UILabel!
    @IBOutlet weak var cellLbl2: UILabel!
    @IBOutlet weak var cellLbl3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
