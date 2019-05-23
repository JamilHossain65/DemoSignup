//
//  GlobalMethod.swift
//  SmartTablet
//
//  Created by thanhlt on 7/3/17.
//  Copyright © 2017 thanhlt. All rights reserved.
//
import UIKit

class GlobalMethod {
    // MARK: - Constants
    static let mainWindow: UIWindow? = UIApplication.shared.delegate?.window as? UIWindow
    static let screenSize: CGRect = UIScreen.main.bounds
    static let isWideScreen: Bool = GlobalMethod.screenSize.height >= 568.0
    static let displayScale: CGFloat = GlobalMethod.screenSize.width / 375.0
    
    // Fonts
    static let mainFont: UIFont = UIFont.systemFont(ofSize: 15.0 * GlobalMethod.displayScale)
    
}

//Created by Jamil
//common method for UIColor
extension UIColor{
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

//Created by Jamil$
//common method for scale display
extension Double {
    func scale() -> CGFloat {
        return CGFloat(self) * GlobalMethod.displayScale
    }
}

extension Int {
    func scale() -> CGFloat {
        return CGFloat(self) * GlobalMethod.displayScale
    }
}

extension CGFloat {
    func scale() -> CGFloat {
        return CGFloat(self) * GlobalMethod.displayScale
    }
}

//Localization
extension String {
    func localize() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
