//
//  ViewController.swift
//  DemoSignup
//
//  Created by Jamil on 5/19/19.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import Foundation

extension  UIView {

    func nextOfX(view:UIView) -> CGFloat {
        return view.frame.origin.x + view.frame.size.width
    }
    
    func nextOfY(view:UIView) -> CGFloat {
        return view.frame.origin.y + view.frame.size.height
    }
    
    func right(view:UIView) -> CGFloat {
        return view.frame.size.width
    }
}

extension UILabel {
   class func getLabel() -> UILabel{
        let label = UILabel()
        label.frame = CGRect(x:0 , y: 0, width:25.scale() , height: 25.scale())
        label.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 12.scale())
        label.textColor = UIColor.init(red: 123, green: 122, blue: 122)
        return label
    }
}

extension UIButton {
    class func getButton() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x:0 , y: 0, width: 30.scale() , height: 40.scale())
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 12.scale())
        button.setTitleColor(UIColor.init(red: 123, green: 122, blue: 122), for: .normal)
        button.backgroundColor = UIColor.clear
        return button
    }
}


extension UITextField {
    func getTextField() -> UITextField{
        let txtField = UITextField()
        txtField.frame = CGRect(x:0 , y: 0, width:25.scale() , height: 25.scale())
        txtField.text = ""
        txtField.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 12.scale())
        txtField.textColor = UIColor.init(red: 123, green: 122, blue: 122)
        txtField.backgroundColor = UIColor.clear
        return txtField
    }
}

extension UIImageView {
    func getImageView() -> UIImageView{
        let imView = UIImageView()
        imView.frame = CGRect(x:0 , y: 0, width:30.scale() , height: 40.scale())
        return imView
    }
}

