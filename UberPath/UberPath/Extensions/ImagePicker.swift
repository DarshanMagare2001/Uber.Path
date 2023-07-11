//
//  ImagePicker.swift
//  UberPath
//
//  Created by IPS-161 on 11/07/23.
//

import Foundation
import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var imageView: UIImageView! // Add this line
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        // Check if the device has a camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showCameraPicker()
        } else {
            showPhotoLibraryPicker()
        }
    }
    
    func showCameraPicker() {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func showPhotoLibraryPicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Handle the selected image
            // For example, assign it to an image view
            imageView.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
