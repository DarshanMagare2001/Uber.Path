//
//  AccountInfoVC.swift
//  UberPath
//
//  Created by IPS-161 on 10/07/23.
//

import UIKit

class AccountInfoVC: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var employerLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var editBtnImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLbl()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editProfilePicture))
        editBtnImageView.addGestureRecognizer(tapGesture)
        editBtnImageView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLbl()
    }
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "EditAccountVC") as! EditAccountVC
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateLbl() {
        let defaults = UserDefaults.standard
        if let yourName = defaults.string(forKey: "yourName") {
            nameLbl.text = yourName
        } else {
            nameLbl.text = "Darshan Magare"
        }
        if let occupation = defaults.string(forKey: "occupation") {
            occupationLbl.text = occupation
        } else {
            occupationLbl.text = "Manager"
        }
        
        if let employer = defaults.string(forKey: "employer") {
            employerLbl.text = employer
        } else {
            employerLbl.text = "Overlay Design"
        }
        
        if let phoneNumber = defaults.string(forKey: "phoneNumber") {
            phoneNumberLbl.text = phoneNumber
        } else {
            phoneNumberLbl.text = "(1) 3256 8456 888"
        }
        
        if let email = defaults.string(forKey: "email") {
            emailLbl.text = email
        } else {
            emailLbl.text = "darshan@gmail.com"
        }
        
        if let imageData = defaults.data(forKey: "userImage") {
            if let image = UIImage(data: imageData) {
                userImageView.image = image
            }
        }
        
    }
    
    @objc func editProfilePicture() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.showCameraPicker()
        }
        let choosePhotoAction = UIAlertAction(title: "Choose Photo", style: .default) { _ in
            self.showPhotoLibraryPicker()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(takePhotoAction)
        alertController.addAction(choosePhotoAction)
        alertController.addAction(cancelAction)
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = editBtnImageView
            popoverController.sourceRect = editBtnImageView.bounds
        }
        present(alertController, animated: true, completion: nil)
    }
    
    func showCameraPicker() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            showAlert(title: "Camera Not Available", message: "Sorry, camera is not available on this device.")
        }
    }
    
    func showPhotoLibraryPicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AccountInfoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Save the selected image to UserDefaults
            let imageData = selectedImage.jpegData(compressionQuality: 1.0)
            UserDefaults.standard.set(imageData, forKey: "userImage")
            // Set the selected image to userImageView
            userImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

