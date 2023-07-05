//
//  ChooseRecipientsCell.swift
//  UberPath
//
//  Created by IPS-161 on 05/07/23.
//

import UIKit

class ChooseRecipientsCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
       @IBOutlet weak var cellLbl: UILabel!
       @IBOutlet weak var cellView: RoundedButtonWithBorder!
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellViewTapped))
           cellView.addGestureRecognizer(tapGesture)
       }
       
    @objc func cellViewTapped() {
        if cellView.backgroundColor == .green {
            cellView.backgroundColor = .white
        } else {
            cellView.backgroundColor = .green
        }
        // Handle tap on cellView here...
    }


}
