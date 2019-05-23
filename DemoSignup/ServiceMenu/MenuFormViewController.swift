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
    func getPeriodData()->[Any]{
        return [
            
            ["外出日", "帰寮日","0"],
            //"outing_day" = "外出日"; "homestay_day" = "帰寮日";
            ["宿泊日数",  "一泊二日","2"],
            //"stay_days" = "宿泊日数";"overnight_stay" = "一泊二日";
            
        ]
    }
    
    //section two detail data
    func getDetailData()->[Any]{
        return [
            //section two
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

    //MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return  self.getHeaderTitleData().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var height : CGFloat = 58.scale()
        if indexPath.section == 1{
            if indexPath.row == 2 || indexPath.row == 4 {
                height = 86.scale()
            }
            
        }
        return height;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var row = 0
        switch section{
        case 0:
            row = 2
        case 1:
            row = 5
            
        default:
            break
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 80.scale()
        }
        return 60.scale()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width:SIZE_WIDTH , height: section == 0 ? 60.scale():80.scale())
        headerView.backgroundColor = UIColor.init(rgbValue: 242)
        
        //
        var mframe = headerView.frame
        mframe.origin.x    = 16
        mframe.size.width = mframe.size.width - 2*mframe.origin.x
        
        mframe.size.height = 20
        mframe.origin.y    = headerView.frame.size.height - mframe.size.height - 10
        
        
        let textLabel : UILabel = UILabel.getLabel()
        textLabel.frame = mframe
        textLabel.font = UIFont.NotoSansCJKJPRegularFont(ofSize: 14.scale())
        textLabel.backgroundColor = .clear //UIColor.init(rgbValue: 68)
        textLabel.text = self.getHeaderTitleData()[section] as? String ?? ""
        textLabel.textColor = UIColor.init(rgbValue: 68)
        
        headerView.addSubview(textLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 &&  indexPath.row == 0{
            
                guard let cell:ServiceMenuDateCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDateCell", for: indexPath) as? ServiceMenuDateCell  else {
                    fatalError("The dequeued cell is not an instance of ServiceMenuDateCell.")
                }
            
                cell.cellSeperator.isHidden = indexPath.row == 0 ? true:false
            
                let titleList:[String] = self.getPeriodData()[indexPath.row] as! [String]
                cell.titleButtonLeft.setTitle(titleList[0], for: .normal)
                cell.dateButtonLeft.setTitle("august9", for: .normal)
                cell.titleButtonRight.setTitle(titleList[1], for: .normal)
                cell.dateButtonRight.setTitle("august11", for: .normal)
            
                return cell
            
        }else{
            guard let cell:ServiceMenuDetailCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDetailCell", for: indexPath) as? ServiceMenuDetailCell  else {
                fatalError("The dequeued cell is not an instance of ServiceMenuDetailCell.")
            }
            
            var titleList:[String] =  self.getDetailData()[indexPath.row] as! [String]
            if indexPath.section == 0{
                 titleList =  self.getPeriodData()[indexPath.row] as! [String]
            }
            
            let tag =  Int(titleList[2]) ?? 0
            cell.textField.delegate = self
            cell.titleLabel.text =  titleList[0]
            
            cell.textField.tag =  tag
            cell.textField.placeholder = titleList[1]
            
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
    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        self.getTextFieldsInformation(textField)
//    }
    
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
