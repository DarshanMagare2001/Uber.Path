//
//  SceneDelegate.swift
//  UberPath
//
//  Created by IPS-161 on 22/06/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if  let currentUser = Auth.auth().currentUser {
            print("User logged in")
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabVC")
            let navigationController = UINavigationController(rootViewController: mainTabVC)
            self.window?.rootViewController = mainTabVC
            self.window?.makeKeyAndVisible()
        }
        else {
            print("User Not logged in")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnboardingVC")
            let navigationController = UINavigationController(rootViewController: onboardingVC)
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

