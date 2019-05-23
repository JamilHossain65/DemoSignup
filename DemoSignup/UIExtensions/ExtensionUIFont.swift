//
//  ViewController.swift
//  DemoSignup
//
//  Created by Jamil on 5/19/19.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

extension UIFont {
    class func NotoSansCJKJPBoldFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKjp-Bold", size: ofSize)!
    }
    
    class func NotoSansCJKJPMediumFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKjp-Medium", size: ofSize)!
    }
    
    class func NotoSansCJKJPRegularFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize:10.0) //UIFont(name: "NotoSansCJKjp-Regular", size: ofSize)!
    }
    class func YuGoBoldFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "YuGothic-Bold", size: ofSize)!
    }
    class func YuGoMediumFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "YuGo-Medium", size: ofSize)!
    }
    class func YuGoRegularFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "YuGo-Regular", size: ofSize)!
    }
    class func HiraKakuProNW6RegularFont(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W6", size: ofSize)!
    }
}
