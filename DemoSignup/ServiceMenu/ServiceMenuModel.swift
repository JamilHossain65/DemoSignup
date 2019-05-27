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
}

class ServiceMenuModel:NSObject,Property {
    //private init() { }
    //public static let shared = ServiceMenuModel()
    
    //UI
    @objc dynamic var from_date: String?
    @objc dynamic var to_date: String?
    @objc dynamic var stay_day_count: String?
    @objc dynamic var stay_home_name: String?
    @objc dynamic var relationship: String?
    @objc dynamic var address: String?
    @objc dynamic var phone_number: String?
    @objc dynamic var remarks: String?
    //demo
    @objc dynamic var value8: String?
    @objc dynamic var value9: String?
    @objc dynamic var value10: String?
    @objc dynamic var value11: String?
    @objc dynamic var value12: String?
    
    //get parameter
    func getParam() -> [String:Any] {
        var param = [String:Any]()
        let propertyList = Mirror(reflecting: self).children.map {$0}
        //enumerate properties
        for child in propertyList.enumerated(){
            let key   = child.element.label
            let value = child.element.value as? String ?? ""
            if let _key = key {
                param[_key] = value
            }
        }
        return param
    }
    
    func setValueFor(tag:Int, text:String) {
        var propertyList = Mirror(reflecting: self).children.map { $0}
        let key = propertyList[tag].label
        if let _key = key {
            self.setValue(text , forKey: _key)
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

class ServiceMenuModelResponse:NSObject {
    //Api response
    var data: String?
    var success: Bool?
    
    func initWith(response: NSDictionary) {
        self.success = response["success"] as? Bool
        self.data = response["data"] as? String
    }
}
