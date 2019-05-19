//
//  ServiceMenuDateCell.swift
//  Domico-App
//
//  Created by chitra on 12/20/18.
//  Copyright © 2018 SEAZOO. All rights reserved.
//

import UIKit

class ServiceMenuDateCell: UITableViewCell {

    var titleButtonLeft: UIButton!
    var dateButtonLeft: UIButton!
    var titleButtonRight: UIButton!
    var dateButtonRight: UIButton!
    var cellSeperator: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let border: CGFloat = 0.0
        var x: CGFloat  = 0
        let y: CGFloat  = 5
        
        var width: CGFloat = SIZE_WIDTH - 2
        let height: CGFloat = self.frame.size.height
        
        //title  left
        width = width/4
        titleButtonLeft = UIButton.getButton()
        titleButtonLeft.frame = CGRect(x:x , y: y, width: width , height: height.scale())
        titleButtonLeft.setTitleColor(UIColor.init(rgbValue: 68), for: .normal)
        titleButtonLeft.contentHorizontalAlignment = .left
        //titleButtonLeft.backgroundColor = UIColor.red
        //set edge insect
        let titleButtonLeftEdge = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        titleButtonLeft.titleEdgeInsets = titleButtonLeftEdge
        self.addSubview(titleButtonLeft)
        
        //date button left
        x = nextOfX(view: titleButtonLeft)
        dateButtonLeft = UIButton.getButton()
        dateButtonLeft.frame = CGRect(x:x , y: y, width: width, height: height.scale())
        dateButtonLeft.titleLabel?.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        dateButtonLeft.setTitleColor(UIColor.init(rgbValue: 74).withAlphaComponent(0.25), for: .normal)
        dateButtonLeft.backgroundColor = UIColor.clear
        dateButtonLeft.setTitle("", for: .normal)
        self.addSubview(dateButtonLeft)
        
        //seperator
        x = nextOfX(view: dateButtonLeft)
        let seperator = UILabel.getLabel()
        seperator.backgroundColor = UIColor.init(red: 242, green: 242, blue: 242)
        seperator.frame = CGRect(x:x , y: -2, width: 3.scale() , height: 87.scale())
        self.addSubview(seperator)

        //title  Right
        x = nextOfX(view: seperator)
        titleButtonRight = UIButton.getButton()
        titleButtonRight.frame = CGRect(x:x , y: y, width: width, height: height.scale())
        titleButtonRight.setTitleColor(UIColor.init(rgbValue: 68), for: .normal)
        titleButtonRight.contentHorizontalAlignment = .left
        titleButtonRight.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        //titleButtonRight.backgroundColor = UIColor.red
        self.addSubview(titleButtonRight)

        //date button Right
        x = nextOfX(view: titleButtonRight)
        dateButtonRight = UIButton.getButton()
        dateButtonRight.frame = CGRect(x:x , y: y, width: width, height: height.scale())
        dateButtonRight.titleLabel?.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        dateButtonRight.setTitleColor(UIColor.init(rgbValue: 74).withAlphaComponent(0.25), for: .normal)
        //dateButtonRight.backgroundColor = UIColor.brown
        dateButtonRight.setTitle("", for: .normal)
        self.addSubview(dateButtonRight)
        
        //cell seperator
        //y = 58.scale() - 2.scale()
        cellSeperator = UILabel.getLabel()
        cellSeperator.frame = CGRect(x:0 , y: 2, width:self.frame.size.width, height: 2.scale())
        cellSeperator.backgroundColor = UIColor.init(rgbValue: 242)
        self.addSubview(cellSeperator)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
