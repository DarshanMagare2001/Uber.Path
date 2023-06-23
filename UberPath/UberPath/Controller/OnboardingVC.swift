//
//  ViewController.swift
//  UberPath
//
//  Created by IPS-161 on 22/06/23.
//

import UIKit

class OnboardingVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let baseFontSize: CGFloat = 17.0 // Define your base font size here

        let adjustedFontSize = FontManager.adjustedFontSize(forBaseSize: baseFontSize)

        // Use the `adjustedFontSize` to create a font with the adjusted size
        let adjustedFont = UIFont.systemFont(ofSize: adjustedFontSize)

        // Use the `adjustedFont` for your labels, buttons, or any other text elements


        // Use the `scaledFont` for your labels, buttons, or any other text elements

    }


}

