import UIKit

class EditCardVC: UIViewController {
    var cardImage: String?
    @IBOutlet weak var personLblView: UIView!
    @IBOutlet weak var personLbl: UILabel!
    @IBOutlet weak var manageLblView: UIView!
    @IBOutlet weak var manageLbl: UILabel!
    @IBOutlet weak var detailLblView: UIView!
    @IBOutlet weak var detailLbl: UILabel!
    
    var selectedView: UIView? // Track the currently selected view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        
        // Add tap gestures to the views
        addTapGesture(to: personLblView)
        addTapGesture(to: manageLblView)
        addTapGesture(to: detailLblView)
        
        // Set the manageLblView as the initially selected view
        selectedView = manageLblView
        selectedView?.backgroundColor = UIColor.white
        selectedView?.layer.shadowOpacity = 0.5
        selectedView?.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        // Add border and corner radius to the manageLblView
        manageLblView.layer.borderWidth = 1.0
        manageLblView.layer.borderColor = UIColor.black.cgColor
        manageLblView.layer.cornerRadius = 10.0
    }

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateFont() {
        personLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        manageLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        detailLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
    }
    
    // Function to add tap gesture to a view
    func addTapGesture(to view: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
    }
    
    // Tap gesture handler
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedView = gesture.view else { return }
        
        // Check if the tapped view is different from the currently selected view
        if tappedView != selectedView {
            // Restore previous view appearance
            selectedView?.backgroundColor = UIColor.clear
            selectedView?.layer.borderWidth = 0
            selectedView?.layer.cornerRadius = 0
            selectedView?.layer.shadowOpacity = 0.0
            
            // Update the selected view
            selectedView = tappedView
            
            // Apply appearance changes to the selected view
            selectedView?.backgroundColor = UIColor.white
            selectedView?.layer.borderWidth = 1.0
            selectedView?.layer.borderColor = UIColor.black.cgColor
            selectedView?.layer.cornerRadius = 10.0
            selectedView?.layer.shadowColor = UIColor.black.cgColor
            selectedView?.layer.shadowOpacity = 0.5
            selectedView?.layer.shadowOffset = CGSize(width: 0, height: 3)
            selectedView?.layer.shadowRadius = 2.0
        }
    }


}

