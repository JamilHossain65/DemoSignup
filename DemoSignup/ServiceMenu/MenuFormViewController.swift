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
    let model = ServiceMenuModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        //titleLabel.text = NSLocalizedString("overnight_stay_Notification", comment: "")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOutsideTextView))
        listTableView.addGestureRecognizer(tap)
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
    
    //MARK:- Table Data Surce
    //section one period data
    func getSection0Data()->[Any]{
        return [
            ["Header Title"],//header row
            ["外出日", "帰寮日","0"],
            //"outing_day" = "外出日"; "homestay_day" = "帰寮日";
            ["宿泊日数",  "一泊二日","2"],
            //"stay_days" = "宿泊日数";"overnight_stay" = "一泊二日";
        ]
    }
    
    //section two detail data
    func getSection1Data()->[Any]{
        return [
            //section two
            ["Header Title"],//header row
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
        ]
    }
    
    func getHeaderTitleData()->[Any]{
        let titleArray = ["期間","外泊先(連絡先)"]
        //["period" = "期間","外泊先(連絡先)"],
        return titleArray
    }
    
    // all section data
    func getTableData()->[Any]{
        return [
            self.getSection0Data(),
            self.getSection1Data(),
        ]
    }
    
    func getHeaderHeight(section:Int) -> CGFloat{
        var height:CGFloat = 0.0
        
        switch section {
        case 1:
            height = 80.scale()
        default:
            height = 60
        }
        return height
    }

    //MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return  self.getHeaderTitleData().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var height : CGFloat = 56.scale()
        if indexPath.row == 0{//section header height
            height = self.getHeaderHeight(section: indexPath.section)
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
        let rowArray = self.getTableData()[section] as AnyObject
        return rowArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set first row for  each header  as a section header
        if indexPath.row == 0 {
            guard let cell: HeaderCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as? HeaderCell  else {
                fatalError("The dequeued cell is not an instance of HeaderCell.")
            }
            
            //title frame
            var mframe = cell.titleLabel.frame
            mframe.origin.y    =  self.getHeaderHeight(section: indexPath.section) - mframe.size.height - 10
            cell.titleLabel.frame = mframe
            cell.titleLabel.text = self.getHeaderTitleData()[indexPath.section] as? String ?? ""
            
            return cell
            
        }else if indexPath.section == 0 &&  indexPath.row == 1{
            
                guard let cell:ServiceMenuDateCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDateCell", for: indexPath) as? ServiceMenuDateCell  else {
                    fatalError("The dequeued cell is not an instance of ServiceMenuDateCell.")
                }
            
                cell.cellSeperator.isHidden = indexPath.row == 1 ? true:false
            
                let titleList:[String] = self.getSection0Data()[indexPath.row] as! [String]
                cell.titleButtonLeft.setTitle(titleList[0], for: .normal)
                cell.dateButtonLeft.setTitle("august9", for: .normal)
                cell.titleButtonRight.setTitle(titleList[1], for: .normal)
                cell.dateButtonRight.setTitle("august11", for: .normal)
            
                return cell
            
        }else{
            guard let cell:ServiceMenuDetailCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDetailCell", for: indexPath) as? ServiceMenuDetailCell  else {
                fatalError("The dequeued cell is not an instance of ServiceMenuDetailCell.")
            }

            let sectionData = self.getTableData()[indexPath.section] as! [[String]]
            let rowData     = sectionData[indexPath.row]
            
//            print("\n")
//            for str in rowData as [AnyObject] {
//                print("[\(indexPath.section)][\(indexPath.row)]:\(str)")
//            }
            
            
            let tag =  Int(rowData[2]) ?? 0
            cell.textField.delegate = self
            cell.titleLabel.text =  rowData[0]
            
            cell.textField.tag =  tag
            cell.textField.placeholder = rowData[1]
            
            //set value of the textfiled
            cell.textField.text = self.getTextfieldValueFor(tag: tag) ?? ""
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
        return selectedValue as? String
    }
    
    //MARK: Submit Button Pressed
    @objc func submitButtonPressed(){
        print("submitButtonPressed")
        
        print("\n param:\(model.getParam())")
        
    }
}


// MARK:- TextFieldDelegate
extension MenuFormViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.getTextFieldsInformation(textField)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
    
    func getTextFieldsInformation( _ textField: UITextField) {
        switch textField.tag {
        case 2:
            model.stay_day_count = NSNumber(value: Int(textField.text ?? "") ?? 0)
        case 3:
            model.stay_home_name = textField.text!
        case 4:
            model.relationship = textField.text!
        case 5:
            model.address   = textField.text!
        case 6:
            model.phone_number = textField.text!
        case 7:
            model.remarks   = textField.text!
        default:
            break
        }
    }
    
}
