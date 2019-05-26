//
//  MenuFormViewController.swift
//  Domico-App
//
//  Created by Jamil on 1/7/19.
//  Copyright © 2019 SEAZOO. All rights reserved.
//

import UIKit

class MenuFormViewController:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var listTableView: UITableView!
    let model = ServiceMenuModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        //titleLabel.text = NSLocalizedString("overnight_stay_Notification", comment: "")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOutsideTextView))
        listTableView.addGestureRecognizer(tap)
        
        /*
        //demo
        //UI
        model.from_date      = "29/05/2019"
        model.to_date        = "30/05/2019"
        model.stay_day_count = "2"
        model.stay_home_name = "Mother's Home"
        model.relationship   = "Mother"
        model.address        = "Kurigram"
        model.phone_number   = "0123546789"
        model.remarks        = "I will stay there in Eid vacation"
        
        //demo
        model.value8  = "value08"
        model.value9  = "value09"
        model.value10 = "value10"
        model.value11 = "value11"
        model.value12 = "value12"
        */
        
    }
    
    //MARK: - Configure View
    func configureTableView() {
        // Register cells
        //self.listTableView.register(UINib(nibName: "OvernightDetailCell", bundle: nil), forCellReuseIdentifier: "OvernightDetailCell")
        
        // Set attributes
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.separatorStyle = .none
        self.listTableView.allowsSelection = false
        
        //table view header
        let headerView    = UIView()
        headerView.frame  = CGRect(x: 0, y: 2, width: SIZE_WIDTH.scale(), height: 87.scale())
        self.listTableView.tableHeaderView = headerView
        
        
        //add detail label
        let detailLabel = UILabel.getLabel()
        detailLabel.frame = CGRect(x: 0, y: 34.scale(), width: SIZE_WIDTH.scale(), height: 24.scale())
        detailLabel.text = "詳細をご入力ください "
        detailLabel.textAlignment = .center
        detailLabel.backgroundColor = .clear
        //set text color
        detailLabel.textColor = UIColor.init(rgbValue: 74)
        detailLabel.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        headerView.addSubview(detailLabel)
        
        //add item label
        let y = self.view.nextOfY(view: detailLabel)
        var mframe = detailLabel.frame
        mframe.origin.y = y
        let itemLabel = UILabel.getLabel()
        itemLabel.frame = mframe
        itemLabel.text = "※外泊先は必須項目です"
        itemLabel.textAlignment = .center
        itemLabel.alpha = 0.6
        itemLabel.backgroundColor = .clear //UIColor.init(rgbValue: 68) //don't scale
        //set text color
        itemLabel.textColor = UIColor.init(rgbValue: 68) //don't scale
        itemLabel.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 12.scale())
        headerView.addSubview(itemLabel)
        
        
        //footer view
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: SIZE_WIDTH.scale(), height: 100.scale())
        footerView.backgroundColor = .clear
        
        //add button on footer view
        let submitButton = UIButton()
        submitButton.frame = CGRect(x: 0, y: 0, width: 310.scale(), height: 45.scale())
        submitButton.setTitle("submit", for: .normal)
        submitButton.titleLabel?.font = UIFont.HiraKakuProNW6RegularFont(ofSize: 16.scale())
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.backgroundColor = UIColor.init(rgbValue: 68)
        submitButton.layer.cornerRadius = 23.5.scale()
        submitButton.center = CGPoint(x: footerView.frame.size.width/2, y: footerView.frame.size.height/2 + 4)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        footerView.addSubview(submitButton)
        self.listTableView.tableFooterView = footerView
        
//        print("tableFooterView.center:\(self.listTableView.tableFooterView?.center)")
//        print("footerView.center     :\(footerView.center)")
//        print("submitButton.center   :\(submitButton.center)")
    }
    
    @objc func tapOutsideTextView() {
        self.view.endEditing(true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
//    //MARK:- Table Data Surce Private method
//    //section first period data
//    func getSection0Data()->[Any]{
//        return [
//            ["期間","80"],//header row
//            ["外出日", "帰寮日","0"],
//            //"outing_day" = "外出日"; "homestay_day" = "帰寮日";
//            ["宿泊日数",  "一泊二日","2"],
//            //"stay_days" = "宿泊日数";"overnight_stay" = "一泊二日";
//        ]
//    }
//    
//    //section second detail data
//    func getSection1Data()->[Any]{
//        return [
//            ["外泊先(連絡先)","80"],//header row
//            ["外泊先  (必須)","実家","3"],
//            //["外泊先  (必須)","実家"],
//            ["続柄","父","4"],
//            //["続柄","父"],
//            ["住所","千代田区外神田 2 - 18 - 8","5"],
//            // ["住所","千代田区外神田 2 - 18 - 8"],
//            ["外泊先電話番号","090 - 0000 - 0000","6"],
//            //["外泊先電話番号","090 - 0000 - 0000"],
//            ["備考","お盆のため、実家に帰省します！","7"],
//            //["備考","お盆のため、実家に帰省します！"],
//            
//            //duplicate data
//            ["Value 8","実家","8"],
//            ["Value 9","父","9"],
//            ["Value 10","千代田区外神田 2 - 18 - 8","10"],
//            ["Value 11","090 - 0000 - 0000","11"],
//            ["Value 12","お盆のため、実家に帰省します！","12"],
//        ]
//    }
//    
//    // all section data
//    func getTableData()->[Any]{
//        return [
//            self.getSection0Data(),
//            self.getSection1Data(),
//        ]
//    }
//    
//    func getHeaderHeight(section:Int) -> CGFloat{
//        let sectionData = getTableData()[section] as! [[String]]
//        let rowData     = sectionData[0]
//        let height      = Double(rowData[1]) ?? 0
//        return CGFloat(height)
//    }

    //MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int
    {
        //return  self.getHeaderTitleData().count
        return model.getTableData().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var height : CGFloat = 56.scale()
        if indexPath.row == 0{//section header height
            height = model.getHeaderHeight(section: indexPath.section)
        }else if indexPath.section == 1{
            if indexPath.row == 3 || indexPath.row == 5 {
                height = 86.scale()
            }
        }
        
        //add seperator height
        if indexPath.row > 1{//add seperator for
            height = height + 2.scale()// seperator height
        }
        return height;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let rowArray = model.getTableData()[section] as AnyObject
        return rowArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionData = model.getTableData()[indexPath.section] as! [[String]]
        let rowData     = sectionData[indexPath.row]
        
        //set first row for  each header  as a section header
        if indexPath.row == 0 {
            guard let cell: HeaderCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? HeaderCell  else {
                fatalError("The dequeued cell is not an instance of HeaderCell.")
            }
            
            //title frame
            var mframe = cell.titleLabel.frame
            mframe.origin.y    =  model.getHeaderHeight(section: indexPath.section) - mframe.size.height - 10
            cell.titleLabel.frame = mframe
            cell.titleLabel.text   = rowData[0]
            
            return cell
            
        }else if indexPath.section == 0 &&  indexPath.row == 1{
            
                guard let cell:ServiceMenuDateCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDateCell", for: indexPath) as? ServiceMenuDateCell  else {
                    fatalError("The dequeued cell is not an instance of ServiceMenuDateCell.")
                }
            
                cell.cellSeperator.isHidden = indexPath.row == 1 ? true:false
            
                let titleList:[String] = model.getSection0Data()[indexPath.row] as! [String]
                cell.titleButtonLeft.setTitle(titleList[0], for: .normal)
                cell.dateButtonLeft.setTitle("august9", for: .normal)
                cell.titleButtonRight.setTitle(titleList[1], for: .normal)
                cell.dateButtonRight.setTitle("august11", for: .normal)
            
                return cell
            
        }else{
            guard let cell:ServiceMenuDetailCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDetailCell", for: indexPath) as? ServiceMenuDetailCell  else {
                fatalError("The dequeued cell is not an instance of ServiceMenuDetailCell.")
            }

            let sectionData = model.getTableData()[indexPath.section] as! [[String]]
            let rowData     = sectionData[indexPath.row]
            
            let tag =  Int(rowData[2]) ?? 0
            cell.titleLabel.text    =  rowData[0]
            cell.textField.tag       =  tag
            cell.textField.delegate   = self
            cell.textField.placeholder = rowData[1]
            
            let key             = model.propertyNames()[tag]
            cell.textField.text = model.property()[key] as? String ?? ""
            return cell
        }
        //
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect row after tap on any cell
        tableView.deselectRow(at: indexPath, animated: true)
        print("index:\(indexPath.row)")
        /*
        let model  = ServiceMenuModel.shared
        let keys   = Array(model.property().keys)
        let selectedKey = keys[indexPath.row]
        let selectedValue = model.property()[selectedKey]
        
        print("all keys:\(keys)")
        print("selectedKey:\(selectedKey)")
        print("selectedValue:\(selectedValue)")
 */
    }
    
    func getTextfieldValueFor(tag:Int) -> String? {
        let keys   = Array(model.property().keys)
        let selectedKey = keys[tag]
        let selectedValue = model.property()[selectedKey]
        //print("tag:: \(tag) key:\(selectedKey) -> \(selectedValue)")
        return selectedValue as? String
    }
    
//    func getValueFor(key:String) -> String {
//        //let keys   = Array(model.property().keys)
//        let selectedValue = model.property()[key]
//        //print("key:\(key) -> \(selectedValue)")
//        return selectedValue as? String ?? ""
//    }
    
    //MARK: Submit Button Pressed
    @objc func submitButtonPressed(){
        print("submitButtonPressed")
        print("\n param:\(model.getParam())")
    }
}


// MARK:- TextFieldDelegate
extension MenuFormViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        model.setValueFor(tag: textField.tag, text: textField.text ?? "")
        self.listTableView.reloadData()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        if string == "\n" {
//         textField.resignFirstResponder()
//        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        
        return false
    }
}
