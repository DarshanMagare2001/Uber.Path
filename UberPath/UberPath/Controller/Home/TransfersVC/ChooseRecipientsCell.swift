import UIKit

class ChooseRecipientsCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellView: RoundedButtonWithBorder!
    private var tickImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellViewTapped))
        cellView.addGestureRecognizer(tapGesture)
        
        setupTickImageView()
    }
    
    private func setupTickImageView() {
        let tickImage = UIImage(systemName: "checkmark")
        tickImageView = UIImageView(image: tickImage)
        tickImageView.contentMode = .scaleAspectFit
        tickImageView.tintColor = (UIColor(named: "LaunchscreenColor") ?? UIColor.gray)
        tickImageView.clipsToBounds = true
        tickImageView.translatesAutoresizingMaskIntoConstraints = false
        tickImageView.isHidden = true
        cellView.addSubview(tickImageView)
        NSLayoutConstraint.activate([
            tickImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            tickImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -8),
            tickImageView.widthAnchor.constraint(equalToConstant: 20),
            tickImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func cellViewTapped() {
        let launchscreenColor = UIColor(named: "LaunchscreenColor")?.cgColor
        if cellView.layer.borderColor == launchscreenColor {
            cellView.layer.borderColor = UIColor.gray.cgColor
            tickImageView.isHidden = true
        } else {
            cellView.layer.borderColor = launchscreenColor
            tickImageView.isHidden = false
        }
        // Handle tap on cellView here...
    }
}

