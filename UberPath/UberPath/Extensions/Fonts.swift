import UIKit

extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

class FontManager {
    
    static func scaledFont(forTextStyle textStyle: UIFont.TextStyle, compatibleWith traitCollection: UITraitCollection) -> UIFont {
        let font = UIFont.preferredFont(forTextStyle: textStyle)
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: font, compatibleWith: traitCollection)
    }
    
    static func adjustedFontSize(forBaseSize baseSize: CGFloat) -> CGFloat {
        let device = UIDevice.current
        let modelName = device.modelName
        
        switch modelName {
        case "iPhone SE", "iPhone SE (2nd generation)", "iPhone 8":
            return baseSize * 0.8 // Adjust font size for smaller iPhones
        case "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XR", "iPhone 11", "iPhone SE (2nd generation)",
             "iPhone 11 Pro", "iPhone 12 mini":
            return baseSize * 0.9 // Adjust font size for medium-sized iPhones
        case "iPhone 11 Pro Max", "iPhone XS Max", "iPhone XR (China)", "iPhone 12", "iPhone 12 Pro", "iPhone 13 mini":
            return baseSize * 1.0 // Adjust font size for larger iPhones
        case "iPhone 12 Pro Max", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max":
            return baseSize * 1.1 // Adjust font size for largest iPhones
        default:
            return baseSize // Use the base size for other iPhones
        }
    }
    
}

