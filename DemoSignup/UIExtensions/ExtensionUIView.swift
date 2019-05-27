//
//  ViewController.swift
//  DemoSignup
//
//  Created by Jamil on 5/19/19.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import Foundation

// Extension UIView
extension UIView {
    /*
     * Created by: hoangnn
     * Description: Disable multi touch for view and it's subViews
     */
    func enableExclusiveTouchForViewAndSubView() {
        // Enable for self
        self.isExclusiveTouch = true

        // Enable for subviews
        for subview in self.subviews {
            subview.enableExclusiveTouchForViewAndSubView()
        }
    }


    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowRadius = 0.0

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

}
