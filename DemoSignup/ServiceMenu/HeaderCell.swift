//
//  HeaderCell.swift
//  Domico-App
//
//  Created by chitra on 12/20/18.
//  Copyright © 2018 SEAZOO. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.init(rgbValue: 244)
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: SIZE_WIDTH , height: self.frame.size.height)
        headerView.backgroundColor = UIColor.init(rgbValue: 242)
        
        var mframe = headerView.frame
        mframe.size.width = mframe.size.width - 2 * mframe.origin.x
        mframe.origin.x    = 16
        mframe.size.height = 20 //text label height
        mframe.origin.y    =  self.frame.size.height - mframe.size.height - 10
        
        titleLabel = UILabel.getLabel()
        titleLabel.frame = mframe
        titleLabel.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        titleLabel.backgroundColor = .clear
        titleLabel.text = "ok".localize()
        titleLabel.textColor = UIColor.init(rgbValue: 68)
        
        headerView.addSubview(titleLabel)
        self.addSubview(headerView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
