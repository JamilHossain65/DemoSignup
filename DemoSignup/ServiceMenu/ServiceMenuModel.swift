//
//  ServiceMenuModel.swift
//  DemoSignup
//
//  Created by Jamil on 5/19/19.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

//https://stackoverflow.com/questions/24844681/list-of-classs-properties-in-swift
protocol Property {
    func property() -> [String:Any]
    func propertyNames() -> [String]
    func propertyValues() -> [Any]
}

extension Property
{
    func property() -> [String:Any] {
      let keys   = Mirror(reflecting: self).children.compactMap { $0.label }
      let values = Mirror(reflecting: self).children.compactMap { $0.value }
      
        var propertyDic = [String:Any]()
        var index = 0
        for key in keys {
            let value = values[index]
            propertyDic[key] = value
            index += 1
        }
        return propertyDic as [String:Any]
    }
    
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
    
    func propertyValues() -> [Any] {
        return Mirror(reflecting: self).children.compactMap { $0.value }
    }
    
}

class ServiceMenuModel:Property {
    //private override init() { }
    public static let shared = ServiceMenuModel()
    
    //UI
    var from_date: String?
    var to_date: String?
    var stay_day_count: NSNumber?
    var stay_home_name: String?
    var relationship: String?
    var address: String?
    var phone_number: String?
    var remarks: String?
    
    //Api response
    var data: String?
    var success: Bool?
    
    //get parameter
    func getParam() -> [String:Any] {
        
        let param: [String:Any] = [
            "from_date"      :  self.from_date ?? "",
            "to_date"        :  self.to_date ?? "",
            "stay_day_count" :  self.stay_day_count ?? 0,
            "stay_home_name" :  self.stay_home_name ?? "",
            
            "relationship"   :  self.relationship ?? "",
            "address"        :  self.address ?? "",
            "phone_number"   :  self.phone_number ?? "",
            "remarks"        :  self.remarks ?? "",
            ]
        return param
    }
    
    func initWith(response: NSDictionary) {
        self.success = response["success"] as? Bool
        self.data = response["data"] as? String
    }
}
