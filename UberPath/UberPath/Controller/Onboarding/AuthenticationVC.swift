//
//  AuthenticationVC.swift
//  UberPath
//
//  Created by IPS-161 on 23/06/23.
//

import UIKit
import Firebase
import GoogleSignIn
import AuthenticationServices

//This class handle all authentication input

class AuthenticationVC: UIViewController,UITextFieldDelegate,GIDSignInDelegate,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @IBOutlet weak var hiThereLbl: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var signInEmailTxtFld: UITextField!
    @IBOutlet weak var signInPasswordTxtFld: UITextField!
    @IBOutlet weak var passwordShowHiddenBtnSignIn: UIButton!
    @IBOutlet weak var passwordShowHiddenBtnSignUp: UIButton!
    @IBOutlet weak var signUpNameTxtFld: UITextField!
    @IBOutlet weak var signUpEmailTxtFld: UITextField!
    @IBOutlet weak var signUpPasswordTxtFld: UITextField!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var createLbl: UILabel!
    @IBOutlet weak var copaymentLbl: UILabel!
    @IBOutlet weak var accontLbl: UILabel!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    var isPasswordShowForSignIn = false
    var isPasswordShowForSignUp = false
    var viewModel = AuthenticationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        signInView.isHidden = false
        signUpView.isHidden = true
        activityView.isHidden = true
        activity.startAnimating()
        signInEmailTxtFld.delegate = self
        signInPasswordTxtFld.delegate = self
        signUpNameTxtFld.delegate = self
        signUpEmailTxtFld.delegate = self
        signUpPasswordTxtFld.delegate = self
        updateFont()
        updatePlaceHolders()
        
    }
    
    @IBAction func backArrowBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func updateFont(){
        hiThereLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        welcomeLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 10.0))
        createLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        copaymentLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
        accontLbl.font = UIFont.systemFont(ofSize: FontManager.adjustedFontSize(forBaseSize: 18.0))
    }
    
    @IBAction func passwordHideShowBtnPressedForSignIn(_ sender: UIButton) {
        isPasswordShowForSignIn.toggle()
        if isPasswordShowForSignIn {
            let image = UIImage(systemName: "eye")
            passwordShowHiddenBtnSignIn.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            passwordShowHiddenBtnSignIn.setImage(image, for: .normal)
        }
        signInPasswordTxtFld.isSecureTextEntry.toggle()
    }
    
    @IBAction func passwordHideShowBtnPressedForSignUp(_ sender: UIButton) {
        isPasswordShowForSignUp.toggle()
        if isPasswordShowForSignUp {
            let image = UIImage(systemName: "eye")
            passwordShowHiddenBtnSignUp.setImage(image, for: .normal)
        }else{
            let image = UIImage(systemName: "eye.slash")
            passwordShowHiddenBtnSignUp.setImage(image, for: .normal)
        }
        signUpPasswordTxtFld.isSecureTextEntry.toggle()
        
        
    }
    
    @IBAction func forgotPasswordBtnPressed(_ sender: UIButton) {
        guard let email = signInEmailTxtFld.text, !email.isEmpty else {
            showToast(message: "Please enter a valid email.")
            return
        }
        
        // Check if email contains "@" symbol
        guard email.contains("@") else {
            showToast(message: "Please enter a valid email.")
            return
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "OTPAuthenticationVC") as! OTPAuthenticationVC
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
//    This is signIn button responsible for signIn
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        guard let email = signInEmailTxtFld.text, let password = signInPasswordTxtFld.text, !email.isEmpty, !password.isEmpty else {
            showToast(message: "Please fill all information.")
            return
        }
        activityView.isHidden = false
        viewModel.signIn(email: email, password: password) { error in
            if let error = error {
                self.showToast(message: "Invalid email or password.")
                self.activityView.isHidden = true
            }else{
                print("SignIn Successfuly")
                // Check if the boolean value is stored as true
                if UserDefaults.standard.bool(forKey: "SomeBooleanKey") {
                    print("The boolean value is true")
                    
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabVC") as! MainTabVC
                    let navigationController = UINavigationController(rootViewController: mainTabVC)
                    if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                       let window = sceneDelegate.window {
                        window.rootViewController = navigationController
                        window.makeKeyAndVisible()
                    }
                    
                } else {
                    // The boolean value is false or not set, handle the case accordingly
                    print("The boolean value is false or not set")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CountryofResidenceVC") as! CountryofResidenceVC
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
                self.activityView.isHidden = true
            }
        }
    }
    
    //    This is signUp button responsible for signUp
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let name = signUpNameTxtFld.text, let email = signUpEmailTxtFld.text, let password = signUpPasswordTxtFld.text,
              !name.isEmpty, !email.isEmpty, !password.isEmpty else {
                  showToast(message: "Please fill all information.")
                  return
              }
        activityView.isHidden = false
        viewModel.signUp(name: name, email: email, password: password) { error in
            if let error = error {
                self.showToast(message: "Email already exists. Please sign in instead.")
                self.activityView.isHidden = true
            }else{
                print("SignUp Successfuly")
                self.activityView.isHidden = true
                if UserDefaults.standard.bool(forKey: "SomeBooleanKey") {
                    print("The boolean value is true")
                    
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabVC") as! MainTabVC
                    let navigationController = UINavigationController(rootViewController: mainTabVC)
                    if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                       let window = sceneDelegate.window {
                        window.rootViewController = navigationController
                        window.makeKeyAndVisible()
                    }
                    
                } else {
                    // The boolean value is false or not set, handle the case accordingly
                    print("The boolean value is false or not set")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CountryofResidenceVC") as! CountryofResidenceVC
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
            }
        }
    }
    
    func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let toastWidth: CGFloat = 300.0
        let toastHeight: CGFloat = 60.0
        let toastX = self.view.frame.size.width / 2 - toastWidth / 2
        let toastY = self.view.frame.size.height - 100.0
        
        toastLabel.frame = CGRect(x: toastX, y: toastY, width: toastWidth, height: toastHeight)
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
//    This is signIn with google
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: UIButton) {
        activityView.isHidden = false
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            activityView.isHidden = true
        }else{
            guard let auth = user.authentication else {return}
            let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
            Auth.auth().signIn(with: credentials) { (results , error) in
                if let error = error{
                    print("Error\(error.localizedDescription)")
                    self.activityView.isHidden = true
                    return
                }else{
                    print("Login Successfuly")
                    self.activityView.isHidden = true
                    if UserDefaults.standard.bool(forKey: "SomeBooleanKey") {
                        print("The boolean value is true")
                        
                        let storyboard = UIStoryboard(name: "Home", bundle: nil)
                        let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabVC") as! MainTabVC
                        let navigationController = UINavigationController(rootViewController: mainTabVC)
                        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                           let window = sceneDelegate.window {
                            window.rootViewController = navigationController
                            window.makeKeyAndVisible()
                        }
                        
                    } else {
                        // The boolean value is false or not set, handle the case accordingly
                        print("The boolean value is false or not set")
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CountryofResidenceVC") as! CountryofResidenceVC
                        self.navigationController?.pushViewController(destinationVC, animated: true)
                    }
                }
            }
        }
        
    }
    
//    This is signIn with apple
    
    @IBAction func signInWithAppleBtnPressed(_ sender: UIButton) {
        activityView.isHidden = false
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @IBAction func goTosignUpBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: {
            self.signInView.isHidden = true
            self.signUpView.isHidden = false
        }, completion: nil)
    }
    
    @IBAction func goTosignInBtnPressed(_ sender: UIButton) {
        UIView.transition(with: view, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: {
            self.signInView.isHidden = false
            self.signUpView.isHidden = true
        }, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the return button is tapped
        textField.resignFirstResponder()
        return true
    }
    
    func updatePlaceHolders(){
        signInEmailTxtFld.placeholder = "Email"
        signInPasswordTxtFld.placeholder = "Password"
        signUpNameTxtFld.placeholder = "Full name"
        signUpEmailTxtFld.placeholder = "Email"
        signUpPasswordTxtFld.placeholder = "Password"
        
    }
    
    // MARK: - ASAuthorizationControllerDelegate
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            
            var fullName: String?
            if let givenName = appleIDCredential.fullName?.givenName,
               let familyName = appleIDCredential.fullName?.familyName {
                fullName = "\(givenName) \(familyName)"
            }
            
            var email: String?
            if let authorizedEmail = appleIDCredential.email {
                email = authorizedEmail
            }
            
            // Use the user's information for further authentication or app-specific actions
            // For example, you can pass the user's details to your sign-in method:
            
            signInWithApple(userIdentifier: userIdentifier, fullName: fullName, email: email)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle any errors that occur during Sign in with Apple
        print("Sign in with Apple error: \(error.localizedDescription)")
        activityView.isHidden = true
    }
    
    func signInWithApple(userIdentifier: String, fullName: String?, email: String?) {
        // Perform your sign-in logic here using the provided user information
        
        // Example code to sign in with Apple using Firebase Authentication:
        let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: userIdentifier, rawNonce: nil)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // Handle sign-in error
                print("Sign-in with Apple error: \(error.localizedDescription)")
                self.showToast(message: "Failed to sign in with Apple.")
                self.activityView.isHidden = true
            } else {
                // Sign-in successful
                if let user = authResult?.user {
                    // You can access the user's unique identifier with user.uid
                    print("Sign-in with Apple successful. User ID: \(user.uid)")
                    // Proceed with further operations after successful sign-in
                    self.activityView.isHidden = true
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyBoard.instantiateViewController(withIdentifier: "CountryofResidenceVC") as! CountryofResidenceVC
                    self.navigationController?.pushViewController(destinationVC, animated: true)
                }
            }
        }
    }
    
    // MARK: - ASAuthorizationControllerPresentationContextProviding
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // Return the window to present the authorization controller
        return self.view.window!
    }
    
    
}
