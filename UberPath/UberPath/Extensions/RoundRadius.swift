//
//  RoundRadius.swift
//  UberPath
//
//  Created by IPS-161 on 23/06/23.
//

import Foundation
import UIKit


class RoundedButton: UIButton {
    // Custom corner radius value
    var cornerRadius: CGFloat = 10 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}



class RoundedButtonWithBorder: UIButton {
    // Custom corner radius value
    var cornerRadius: CGFloat = 10 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // Custom border width value
    var borderWidth: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // Custom border color value
    var borderColor: UIColor = .gray {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        // Set border
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

class CircleView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        // Set the corner radius to half of the view's width to make it a circle
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = false
        // Add shadow properties
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 5)
        layer.shadowRadius = 5
        // Create a shadow path to improve performance
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}

class RoundedViewWithBorder: UIView {
    // Custom corner radius value
    var cornerRadius: CGFloat = 20 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // Custom border width value
    var borderWidth: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // Custom border color value
    var borderColor: UIColor = .gray {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        // Set border
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}


