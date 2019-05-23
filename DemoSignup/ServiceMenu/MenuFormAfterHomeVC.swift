//
//  MenuFormAfterHomeVC.swift
//  Domico-App
//
//  Created by Jamil on 1/7/19.
//  Copyright © 2019 SEAZOO. All rights reserved.
//

import UIKit

class MenuFormAfterHomeVC:UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.navigationController?.title = "overnight_stay_Notification".localize()
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
        detailLabel.text = "please_enter_details".localize()
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
        itemLabel.text = "overnight_accommodation_required_item".localize()
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
        self.listTableView.tableFooterView = footerView
        
        //add button on footer view
        let submitButton = UIButton.getButton()
        submitButton.frame = CGRect(x: 0, y: 0, width: 310.scale()   , height: 45.scale())
        //button.setTitle(UIText.ChatChooseDate.localized, for: .normal)
        
        submitButton.setTitle("submit".localize(), for: .normal)
        submitButton.titleLabel?.font = UIFont.HiraKakuProNW6RegularFont(ofSize: 16.scale())
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.backgroundColor = UIColor.init(rgbValue: 68)
        submitButton.layer.cornerRadius = 23.5.scale()
        submitButton.center = CGPoint(x: footerView.frame.size.width/2, y: footerView.frame.size.height/2)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        footerView.addSubview(submitButton)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func submitButtonPressed(){
        print("submitButtonPressed")
    }

    //section one period data
    func getPeriodData()->[Any]{
        return [
            
            ["outing_day".localize(), "homestay_day".localize()],
            ["stay_days".localize(),  "please_enter_the_overtime_period".localize()],
            //"stay_days" = "宿泊日数";//外泊期間をご入力ください。
        ]
    }
    
    //section two detail data
    func getDetailData()->[Any]{
        return [
            //section two
                ["extra_night_accommodation_mandatory".localize(),"home".localize()], //["外泊先  (必須)","実家"],
                ["relation".localize(),"father".localize()],                   //["続柄","父"],
                ["street_address".localize(),"chiyoda_address".localize()],// ["住所","千代田区外神田 2 - 18 - 8"],
                ["outside_night_phone_number".localize(),"sample_phone_number".localize()],//["外泊先電話番号","090 - 0000 - 0000"],
                ["remarks".localize(),"remarks_value".localize()],//["備考","お盆のため、実家に帰省します！"],
        ]
    }
    
    func getHeaderTitleData()->[Any]{
        let titleArray = ["period".localize(),"outside_hotel_contact_details".localize()]
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
            row = 0
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width:SIZE_WIDTH , height: section == 0 ? 60:80)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 80
        }
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 &&  indexPath.row == 0{
            
                guard let cell:ServiceMenuDateCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDateCell", for: indexPath) as? ServiceMenuDateCell  else {
                    fatalError("The dequeued cell is not an instance of ServiceMenuDateCell.")
                }
            
                cell.cellSeperator.isHidden = indexPath.row == 0 ? true:false
            
                let titleList:[String] = self.getPeriodData()[indexPath.row] as! [String]
                cell.titleButtonLeft.setTitle(titleList[0], for: .normal)
                cell.dateButtonLeft.setTitle("august9".localize(), for: .normal)
                cell.titleButtonRight.setTitle(titleList[1], for: .normal)
                cell.dateButtonRight.setTitle("august11".localize(), for: .normal)
            
                return cell
            
        }else{
            guard let cell:ServiceMenuDetailCell = tableView.dequeueReusableCell(withIdentifier: "ServiceMenuDetailCell", for: indexPath) as? ServiceMenuDetailCell  else {
                fatalError("The dequeued cell is not an instance of ServiceMenuDetailCell.")
            }
            
            var titleList:[String] =  self.getDetailData()[indexPath.row] as! [String]
            if indexPath.section == 0{
                 titleList =  self.getPeriodData()[indexPath.row] as! [String]
            }
            cell.titleLabel.text =  titleList[0]
            cell.textField.text =  titleList[1]
            
            //set text color
            cell.textField.alpha = 0.25
            
            //set attribute text
            if(indexPath.row == 0){
                
                let main_string = cell.titleLabel.text //"Hello World"
                let string_to_color = "(必須)"//"World"
                let range = (main_string! as NSString).range(of: string_to_color)
                
                let attributedString = NSMutableAttributedString.init(string: main_string ?? "")
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor._mangoColor() , range: range)

                
                cell.titleLabel.text = ""
                cell.titleLabel.attributedText = attributedString
                
            }
            
            return cell
        }
        //
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index:\(indexPath.row)")
        
        
    }
    
}
