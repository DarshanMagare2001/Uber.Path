import UIKit

class CreatePinVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var setPinLbl: UILabel!
    @IBOutlet weak var weUseLbl: UILabel!
    @IBOutlet weak var pinTxtFld1: UITextField!
    @IBOutlet weak var pinTxtFld2: UITextField!
    @IBOutlet weak var pinTxtFld3: UITextField!
    @IBOutlet weak var pinTxtFld4: UITextField!
    @IBOutlet weak var pinTxtFld5: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        setupTextFields()
    }

    func updateFont() {
        setPinLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        weUseLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }

    func setupTextFields() {
        pinTxtFld1.delegate = self
        pinTxtFld2.delegate = self
        pinTxtFld3.delegate = self
        pinTxtFld4.delegate = self
        pinTxtFld5.delegate = self

        pinTxtFld1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        pinTxtFld2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        pinTxtFld3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        pinTxtFld4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        pinTxtFld1.returnKeyType = .next
        pinTxtFld2.returnKeyType = .next
        pinTxtFld3.returnKeyType = .next
        pinTxtFld4.returnKeyType = .next
        pinTxtFld5.returnKeyType = .done

        addDoneButtonToTextField(pinTxtFld1)
        addDoneButtonToTextField(pinTxtFld2)
        addDoneButtonToTextField(pinTxtFld3)
        addDoneButtonToTextField(pinTxtFld4)
        addDoneButtonToTextField(pinTxtFld5)
    }

    func addDoneButtonToTextField(_ textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))

        toolbar.items = [flexSpace, doneButton]
        textField.inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        // Implement any additional functionality for the "Done" button if needed
        view.endEditing(true) // Dismiss the keyboard
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""

        if currentText.count > 1 {
            // If the text field has more than one character, update the text to only the first character
            textField.text = String(currentText.prefix(1))
            textField.sendActions(for: .editingChanged)
            return false
        }

        return true
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case pinTxtFld1:
                pinTxtFld2.becomeFirstResponder()
            case pinTxtFld2:
                pinTxtFld3.becomeFirstResponder()
            case pinTxtFld3:
                pinTxtFld4.becomeFirstResponder()
            case pinTxtFld4:
                pinTxtFld5.becomeFirstResponder()
            default:
                break
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        return true
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

