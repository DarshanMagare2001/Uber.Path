//
//  ChooseCardsCell.swift
//  UberPath
//
//  Created by IPS-161 on 05/07/23.
//

import UIKit

class ChooseCardsCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var checkMarkImageView: UIImageView!

    override var isSelected: Bool {
        didSet {
            checkMarkImageView.isHidden = !isSelected
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        checkMarkImageView.isHidden = true
    }
}
