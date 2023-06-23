import UIKit

extension UIDevice {
    var modelName: String {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        // Map the identifier to the corresponding model name
        let modelMapping: [String: String] = [
            // iPhone
            "iPhone1,1": "iPhone 1G",
            "iPhone1,2": "iPhone 3G",
            "iPhone2,1": "iPhone 3GS",
            "iPhone3,1": "iPhone 4",
            "iPhone3,2": "iPhone 4",
            "iPhone3,3": "iPhone 4",
            "iPhone4,1": "iPhone 4S",
            "iPhone5,1": "iPhone 5",
            "iPhone5,2": "iPhone 5",
            "iPhone5,3": "iPhone 5C",
            "iPhone5,4": "iPhone 5C",
            "iPhone6,1": "iPhone 5S",
            "iPhone6,2": "iPhone 5S",
            "iPhone7,1": "iPhone 6 Plus",
            "iPhone7,2": "iPhone 6",
            "iPhone8,1": "iPhone 6S",
            "iPhone8,2": "iPhone 6S Plus",
            "iPhone8,4": "iPhone SE (1st generation)",
            "iPhone9,1": "iPhone 7",
            "iPhone9,2": "iPhone 7 Plus",
            "iPhone9,3": "iPhone 7",
            "iPhone9,4": "iPhone 7 Plus",
            "iPhone10,1": "iPhone 8",
            "iPhone10,2": "iPhone 8 Plus",
            "iPhone10,3": "iPhone X",
            "iPhone10,4": "iPhone 8",
            "iPhone10,5": "iPhone 8 Plus",
            "iPhone10,6": "iPhone X",
            "iPhone11,2": "iPhone XS",
            "iPhone11,4": "iPhone XS Max",
            "iPhone11,6": "iPhone XS Max",
            "iPhone11,8": "iPhone XR",
            "iPhone12,1": "iPhone 11",
            "iPhone12,3": "iPhone 11 Pro",
            "iPhone12,5": "iPhone 11 Pro Max",
            "iPhone12,8": "iPhone SE (2nd generation)",
            "iPhone13,1": "iPhone 12 mini",
            "iPhone13,2": "iPhone 12",
            "iPhone13,3": "iPhone 12 Pro",
            "iPhone13,4": "iPhone 12 Pro Max",
            "iPhone14,4": "iPhone 13 mini",
            "iPhone14,5": "iPhone 13",
            "iPhone14,2": "iPhone 13 Pro",
            "iPhone14,3": "iPhone 13 Pro Max",
            "iPhone14,8": "iPhone 13 Pro Max",
            "iPhone14,4": "iPhone 13 mini",
            "iPhone14,5": "iPhone 13",
            "iPhone14,2": "iPhone 13 Pro",
            "iPhone14,3": "iPhone 13 Pro Max",
            "iPhone14,1": "iPhone 13 mini",
            "iPhone14,7": "iPhone 13",
            "iPhone14,4": "iPhone 13 Pro",
            "iPhone14,5": "iPhone 13 Pro Max",
            
            // Add more mappings for other iPhone models if needed
        ]
        
        if let modelName = modelMapping[identifier] {
            print(identifier)
            return modelName
        } else {
            return identifier
        }
    }
}

class FontManager {
    static func adjustedFontSize(forBaseSize baseSize: CGFloat) -> CGFloat {
        let device = UIDevice.current
        let modelName = device.name
        print(modelName)
        var adjustedSize = baseSize // Default size
        
        switch modelName {
        case "iPhone 1G", "iPhone 3G", "iPhone 3GS":
            adjustedSize *= 0.8
        case "iPhone 4", "iPhone 4S":
            adjustedSize *= 0.9
            
        case "iPhone 5", "iPhone 5C", "iPhone 5S","iPhone SE (1st generation)" :
            adjustedSize *= 1
            
        case "iPhone 6", "iPhone 6S", "iPhone 7", "iPhone 8" , "iPhone SE (2nd generation)":
            adjustedSize *= 1.4
            
        case "iPhone 6 Plus", "iPhone 6S Plus", "iPhone 7 Plus", "iPhone 8 Plus":
            adjustedSize *= 1.8
            
        case  "iPhone X", "iPhone XS","iPhone 11 Pro":
            adjustedSize *= 1.8
        case "iPhone XR" , "iPhone 11":
            adjustedSize *= 2
            
        case "iPhone XS Max", "iPhone 11 Pro Max" :
            adjustedSize *= 2
            
        case "iPhone 12 mini" , "iPhone 13 mini":
            adjustedSize *= 2
            
        case "iPhone 12","iPhone 13":
            adjustedSize *= 2
        case "iPhone 12 Pro Max","iPhone 13 Pro Max":
            adjustedSize *= 2
        case "iPhone 12 Pro","iPhone 13 Pro":
            adjustedSize *= 2.1
        default:
            break // No adjustment needed
        }
        print("Adjusted font size for \(modelName): \(adjustedSize)")
        return adjustedSize
    }
}

