import UIKit

class TransfersVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var recipientsCollectionView: UICollectionView!
    @IBOutlet weak var chooseCardsLbl: UILabel!
    @IBOutlet weak var chooseRecepientLbl: UILabel!
    @IBOutlet weak var textFld: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    var collectionViewOutletArray = ["CardStyleOne", "CardStyleThree", "CardStyleTwo"]
    var recipientsCollectionViewArray = ["Linda John", "David William", "Susan Charles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        recipientsCollectionView.delegate = self
        recipientsCollectionView.dataSource = self
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        textFld.delegate = self
        updatePlaceholders()
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterFromKeyboardNotifications()
    }
     
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
     
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TransferDetailVC") as! TransferDetailVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOutlet {
            return collectionViewOutletArray.count
        } else if collectionView == recipientsCollectionView {
            return recipientsCollectionViewArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOutlet {
            let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cardCollectionCell", for: indexPath) as! ChooseCardsCell
            cell.cellImage.image = UIImage(named: collectionViewOutletArray[indexPath.row])
            
            if collectionViewOutlet.indexPathsForSelectedItems?.contains(indexPath) ?? false {
                cell.showTickMark(true)
            } else {
                cell.showTickMark(false)
            }
            
            return cell
        } else if collectionView == recipientsCollectionView {
            let cell = recipientsCollectionView.dequeueReusableCell(withReuseIdentifier: "recipientsCollectionViewCell", for: indexPath) as! ChooseRecipientsCell
            cell.cellImage.image = UIImage(named: recipientsCollectionViewArray[indexPath.row])
            cell.cellLbl.text = recipientsCollectionViewArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewOutlet {
            print("collectionViewOutlet")
            if let selectedCell = (collectionView.cellForItem(at: indexPath) as? ChooseCardsCell) {
                selectedCell.isSelected = true
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
                collectionView.reloadData() // Refresh collection view after selection
                // Handle selected cell in collectionViewOutlet...
            }
        } else if collectionView == recipientsCollectionView {
            print("recipientsCollectionView")
            if let selectedCell = (collectionView.cellForItem(at: indexPath) as? ChooseRecipientsCell) {
                selectedCell.isSelected = true
                let imageName = recipientsCollectionViewArray[indexPath.row]
                print("Selected image name: \(imageName)")
                // Handle selected cell in recipientsCollectionView...
            }
        }
    }

  
    func updateFont() {
        chooseCardsLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
        chooseRecepientLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 20.0))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updatePlaceholders() {
        textFld.placeholder = "Search contacts..."
    }
    
    // MARK: - Keyboard Handling
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                  return
              }
        
        let keyboardHeight = keyboardFrame.height
        let safeAreaBottomInset = view.safeAreaInsets.bottom
        
        scrollView.contentInset.bottom = keyboardHeight - safeAreaBottomInset
        scrollView.scrollIndicatorInsets.bottom = keyboardHeight - safeAreaBottomInset
        
        if let activeTextField = findActiveTextField(),
           let activeTextFieldFrame = activeTextField.superview?.convert(activeTextField.frame, to: scrollView) {
            
            let visibleContentHeight = scrollView.bounds.height - scrollView.contentInset.bottom
            
            if !(activeTextFieldFrame.maxY <= visibleContentHeight) {
                let scrollOffset = CGPoint(x: 0, y: activeTextFieldFrame.maxY - visibleContentHeight)
                scrollView.setContentOffset(scrollOffset, animated: true)
            }
        }
    }

    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    func findActiveTextField() -> UITextField? {
        let textFields: [UITextField] = [textFld]
        return textFields.first { $0.isFirstResponder }
    }
}

