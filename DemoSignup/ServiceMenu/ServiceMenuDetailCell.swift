//
//  ServiceMenuDetailCell.swift
//  Domico-App
//
//  Created by chitra on 12/20/18.
//  Copyright © 2018 SEAZOO. All rights reserved.
//

import UIKit

class ServiceMenuDetailCell: UITableViewCell {

    var titleLabel: UILabel!
    var textField: UITextField!
    var cellSeperator: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var x: CGFloat  = 16
        var y: CGFloat  = 7
        
        let width: CGFloat = SIZE_WIDTH
        let height: CGFloat = self.frame.size.height
        
        //title
        titleLabel = UILabel.getLabel()
        titleLabel.frame = CGRect(x:x , y: y, width:100.scale() , height: height.scale())
        titleLabel.textColor = UIColor.init(rgbValue: 68)
        titleLabel.backgroundColor = UIColor.clear
        self.addSubview(titleLabel)
        
        //open-close menu
        x = self.nextOfX(view: titleLabel) + 1
        textField = UITextField()
        textField.frame = CGRect(x:x , y: y, width:width - x , height: height.scale())
        
        //textField.numberOfLines = 2
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.init(rgbValue: 74)
        textField.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        self.addSubview(textField)
        
        //cell seperator
        //y = 58.scale() - 2.0.scale()
        cellSeperator = UILabel.getLabel()
        cellSeperator.frame = CGRect(x:0 , y: 0, width: SIZE_WIDTH, height: 2)
        cellSeperator.backgroundColor = UIColor.init(rgbValue: 242)
        self.addSubview(cellSeperator)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
