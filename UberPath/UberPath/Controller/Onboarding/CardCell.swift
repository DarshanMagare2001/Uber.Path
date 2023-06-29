//
//  CardCell.swift
//  UberPath
//
//  Created by IPS-161 on 29/06/23.
//

import UIKit

protocol CardCellDelegate: AnyObject {
    func cardImageTapped(in cell: CardCell)
}

class CardCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    weak var delegate: CardCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        cardImageView.addGestureRecognizer(tapGesture)
        cardImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped() {
        delegate?.cardImageTapped(in: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

