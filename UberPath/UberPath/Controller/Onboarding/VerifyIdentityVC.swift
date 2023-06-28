import UIKit
import Photos

class VerifyIdentityVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var letsVerifyLbl: UILabel!
    @IBOutlet weak var weareRequiredLbl: UILabel!
    @IBOutlet weak var faceIDImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFont()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(faceIDImageViewTapped))
        faceIDImageView.addGestureRecognizer(tapGesture)
        faceIDImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        // Handle continue button action
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func faceIDImageViewTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { _ in
            self.checkPhotoLibraryPermission { granted in
                if granted {
                    DispatchQueue.main.async {
                        let imagePickerController = UIImagePickerController()
                        imagePickerController.sourceType = .photoLibrary
                        imagePickerController.delegate = self
                        self.present(imagePickerController, animated: true, completion: nil)
                    }
                } else {
                    self.showPhotoLibraryPermissionDeniedAlert()
                }
            }
        }
        alertController.addAction(chooseFromLibraryAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
                self.checkCameraPermission { granted in
                    if granted {
                        DispatchQueue.main.async {
                            let imagePickerController = UIImagePickerController()
                            imagePickerController.sourceType = .camera
                            imagePickerController.delegate = self
                            self.present(imagePickerController, animated: true, completion: nil)
                        }
                    } else {
                        self.showCameraPermissionDeniedAlert()
                    }
                }
            }
            alertController.addAction(takePhotoAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                completion(status == .authorized)
            }
        @unknown default:
            completion(false)
        }
    }
    
    func showPhotoLibraryPermissionDeniedAlert() {
        let alertController = UIAlertController(title: "Permission Denied", message: "Please grant permission to access the photo library in the Settings app.", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completion(granted)
            }
        @unknown default:
            completion(false)
        }
    }
    
    func showCameraPermissionDeniedAlert() {
        let alertController = UIAlertController(title: "Permission Denied", message: "Please grant permission to access the camera in the Settings app.", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.faceIDImageView.image = pickedImage
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func updateFont(){
        letsVerifyLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        weareRequiredLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 15.0))
    }
    
    
}

