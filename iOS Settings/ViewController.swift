//
//  ViewController.swift
//  iOS Settings
//
//  Created by Xavier Li on 5/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sectionHeaderHeight : CGFloat = 18

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Select")
    }
    //standard header and footer. Ref: https://developer.apple.com/documentation/uikit/views_and_controls/table_views/adding_headers_and_footers_to_table_sections
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Header: \(section)"
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Footer: \(section)"
//    }

    /*
     custom header and footer
     Ref1. https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-section-header-to-a-table-view
     Ref2. https://developer.apple.com/documentation/uikit/views_and_controls/table_views/adding_headers_and_footers_to_table_sections
     */
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var headerView = UIView()
//        headerView.backgroundColor = UIColor.red
//        return headerView
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myCGRect = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: sectionHeaderHeight)
        let myHeaderView = UIView(frame:myCGRect)
        myHeaderView.backgroundColor = UIColor(red: 235/255, green: 234/255, blue: 238/255, alpha: 1)
        let myUILabel = UILabel(frame: myCGRect)
        //myUILabel.text = "Header: \(options[section])"
        myHeaderView.addSubview(myUILabel)
        return myHeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    //determine number of section by the number of SettingOptions objects
    func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    //determine number of rows by the number of options in the options (sub)array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options[section].options.count
    }
    
    //define contents of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var imageName : String
        var labelDesc = options[indexPath.section].options[indexPath.row]
        imageName = "Icons-" + labelDesc
        myCell.backgroundColor = UIColor.white
        myCell.myItemLabel.text = labelDesc
        myCell.myItemImage.image = UIImage(named: imageName)
        return myCell
        
    }
        
    var options = [SettingOptions]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
         prepare data of setting options by creating SO objects
         and saving them to the options array
         */
        options.append(SettingOptions.init(cat: "Communication", opt: [
            "Airplane Mode",
            "Wi-Fi",
            "Bluetooth",
            "Cellular",
            "VPN"
        ]))
        options.append(SettingOptions.init(cat: "Notifications", opt: [
            "Notifications",
            "Sounds & Haptics",
            "Focus",
            "Screen Time"
        ]))
        options.append(SettingOptions.init(cat: "System", opt: [
            "General",
            "Control Center",
            "Display & Brightness",
            "Home Screen",
            "Accessibility",
            "Wallpaper",
            "Siri & Search",
            "Touch ID & Passcode",
            "Emergency SOS",
            "Exposure Notifications",
            "Battery",
            "Privacy"
        ]))
        options.append(SettingOptions.init(cat: "Shopping", opt: [
            "App Store",
            "Wallet & Apple Pay",
            "Apple Store"
        ]))
    }
}

class SettingOptions {
    var category : String
    var options : [String]
    init(cat : String, opt : [String]) {
        self.category = cat
        self.options = opt
    }
}
