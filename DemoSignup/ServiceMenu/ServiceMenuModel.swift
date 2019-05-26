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
//    func propertyValues() -> [Any]
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
        return Mirror(reflecting: self).children.map{ $0.label! }
    }
//
//    func propertyValues() -> [Any] {
//        return Mirror(reflecting: self).children.compactMap { $0.value }
//    }
    
}

class ServiceMenuModel:Property {
    //private init() { }
    //public static let shared = ServiceMenuModel()
    
    //UI
    var from_date: String?
    var to_date: String?
    var stay_day_count: String?
    var stay_home_name: String?
    var relationship: String?
    var address: String?
    var phone_number: String?
    var remarks: String?
    //demo
    var value8: String?
    var value9: String?
    var value10: String?
    var value11: String?
    var value12: String?
    
    //get parameter
    func getParam() -> [String:Any] {
        
        let param: [String:Any] = [
            "from_date"      :  self.from_date ?? "",
            "to_date"        :  self.to_date ?? "",
            "stay_day_count" :  self.stay_day_count ?? "",
            "stay_home_name" :  self.stay_home_name ?? "",
            
            "relationship"   :  self.relationship ?? "",
            "address"        :  self.address ?? "",
            "phone_number"   :  self.phone_number ?? "",
            "remarks"        :  self.remarks ?? "",
            //demo
        "value8"         :  self.value8 ?? "",
        "value9"         :  self.value9 ?? "",
        "value10"        :  self.value10 ?? "",
        "value11"        :  self.value11 ?? "",
        "value12"        :  self.value12 ?? "",
        
            ]
        return param
    }
    
    func setValueFor(tag:Int, text:String) {
        
        //self.property()[self.allValues[tag]] = text
//        Mirror(reflecting: self).children.map{(dict) -> [String : Any] in
//            dict["stay_day_count"] = 1020
//        }
        
        /*
        var propertyList = Mirror(reflecting: self).children.map { $0}
        let key = propertyList[tag].label
        
        print("propertyList\n:\(propertyList)")
        print("result:\(String(describing: key))")
        
        for index in 0..<propertyList.count {
            let label = propertyList[index].label
            if let _label = label,_label == key {
                propertyList[index].value = text // copied by value
            }
        }
        
        for prty in Mirror(reflecting: self).children {
            var test = prty
            print("prty:\(prty)")
        }
        print("upadte propertyList::\n \(propertyList)")
        
        */
        
        return
        
        switch tag {
        case 2:
            self.stay_day_count = text
        case 3:
            self.stay_home_name = text
        case 4:
            self.relationship = text
        case 5:
            self.address   = text
        case 6:
            self.phone_number = text
        case 7:
            self.remarks   = text
        case 8:
            self.value8   = text
        case 9:
            self.value9   = text
        case 10:
            self.value10   = text
        case 11:
            self.value11   = text
        case 12:
            self.value12   = text
        default:
            break
        }
    }
    
    
    //MARK:- Table Data Surce Private method
    //section first period data
    func getSection0Data()->[Any]{
        return [
            ["期間","80"],//header row
            ["外出日", "帰寮日","0"],
            //"outing_day" = "外出日"; "homestay_day" = "帰寮日";
            ["宿泊日数",  "一泊二日","2"],
            //"stay_days" = "宿泊日数";"overnight_stay" = "一泊二日";
        ]
    }
    
    //section second detail data
    func getSection1Data()->[Any]{
        return [
            ["外泊先(連絡先)","80"],//header row
            ["外泊先  (必須)","実家","3"],
            //["外泊先  (必須)","実家"],
            ["続柄","父","4"],
            //["続柄","父"],
            ["住所","千代田区外神田 2 - 18 - 8","5"],
            // ["住所","千代田区外神田 2 - 18 - 8"],
            ["外泊先電話番号","090 - 0000 - 0000","6"],
            //["外泊先電話番号","090 - 0000 - 0000"],
            ["備考","お盆のため、実家に帰省します！","7"],
            //["備考","お盆のため、実家に帰省します！"],
            
            //duplicate data
            ["Value 8","実家","8"],
            ["Value 9","父","9"],
            ["Value 10","千代田区外神田 2 - 18 - 8","10"],
            ["Value 11","090 - 0000 - 0000","11"],
            ["Value 12","お盆のため、実家に帰省します！","12"],
        ]
    }
    
    // all section data
    func getTableData()->[Any]{
        return [
            self.getSection0Data(),
            self.getSection1Data(),
        ]
    }
    
    func getHeaderHeight(section:Int) -> CGFloat{
        let sectionData = getTableData()[section] as! [[String]]
        let rowData     = sectionData[0]
        let height      = Double(rowData[1]) ?? 0
        return CGFloat(height)
    }
    
    
}

class ServiceMenuModelResponse:Property {
    //Api response
    var data: String?
    var success: Bool?
    
    func initWith(response: NSDictionary) {
        self.success = response["success"] as? Bool
        self.data = response["data"] as? String
    }
}
