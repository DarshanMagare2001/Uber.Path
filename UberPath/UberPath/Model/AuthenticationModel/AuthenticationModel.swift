//
//  AuthenticationModel.swift
//  UberPath
//
//  Created by IPS-161 on 26/06/23.
//

import Foundation
import FirebaseAuth



class AuthenticationModel {
    func signUp(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle sign-up error
                print("Sign-up error: \(error.localizedDescription)")
                return
            }
            
            // Sign-up successful
            // You can access the user's unique identifier with authResult?.user.uid
            
            print("Sign-up successful with email: \(email)")
            // Perform any additional operations after successful sign-up
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                // Handle sign-in error
                print("Sign-in error: \(error.localizedDescription)")
                return
            }
            
            // Sign-in successful
            // You can access the user's unique identifier with authResult?.user.uid
            
            print("Sign-in successful with email: \(email)")
            // Perform any additional operations after successful sign-in
        }
    }
    
    func getCurrentUserEmail() -> String? {
        if let currentUser = Auth.auth().currentUser {
            return currentUser.email
        } else {
            return nil
        }
    }
    
    
    
}

