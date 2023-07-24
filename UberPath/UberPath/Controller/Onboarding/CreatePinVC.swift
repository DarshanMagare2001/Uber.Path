
import UIKit

class CreatePinVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var setPinLbl: UILabel!
    @IBOutlet weak var weUseLbl: UILabel!
    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    @IBOutlet weak var otpTextField5: UITextField!
    
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
        otpTextField1.delegate = self
        otpTextField2.delegate = self
        otpTextField3.delegate = self
        otpTextField4.delegate = self
        otpTextField5.delegate = self

        otpTextField1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTextField2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTextField3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTextField4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otpTextField5.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        otpTextField1.returnKeyType = .next
        otpTextField2.returnKeyType = .next
        otpTextField3.returnKeyType = .next
        otpTextField4.returnKeyType = .next
        otpTextField5.returnKeyType = .done

        addDoneButtonToTextField(otpTextField1)
        addDoneButtonToTextField(otpTextField2)
        addDoneButtonToTextField(otpTextField3)
        addDoneButtonToTextField(otpTextField4)
        addDoneButtonToTextField(otpTextField5)
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

        // Check if the replacement string will result in an empty text field
        if currentText.isEmpty {
            // If the current text field will be empty, clear it and move to the previous one
            switch textField {
            case otpTextField5:
                otpTextField5.text = ""
                otpTextField4.becomeFirstResponder()
            case otpTextField4:
                otpTextField4.text = ""
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                otpTextField3.text = ""
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField2.text = ""
                otpTextField1.becomeFirstResponder()
            default:
                break
            }
            return false
        } else if currentText.count > 1 {
            // If the text field has more than one character, update the text to only the first character
            textField.text = String(currentText.prefix(1))
            textField.sendActions(for: .editingChanged)
            return false
        }

        // If neither of the above conditions is met, allow the change
        return true
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case otpTextField1:
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                otpTextField4.becomeFirstResponder()
            case otpTextField4:
                otpTextField5.becomeFirstResponder()
            default:
                break
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // If the user presses the clear button, clear the text field and move to the previous one
        switch textField {
        case otpTextField5:
            otpTextField5.text = ""
            otpTextField4.becomeFirstResponder()
        case otpTextField4:
            otpTextField4.text = ""
            otpTextField3.becomeFirstResponder()
        case otpTextField3:
            otpTextField3.text = ""
            otpTextField2.becomeFirstResponder()
        case otpTextField2:
            otpTextField2.text = ""
            otpTextField1.becomeFirstResponder()
        default:
            break
        }
        return true
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

