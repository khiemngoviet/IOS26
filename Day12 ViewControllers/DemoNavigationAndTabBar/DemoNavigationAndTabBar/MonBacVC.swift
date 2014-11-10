//
//  MonBacVC.swift
//  DemoNavigationAndTabBar
//
//  Created by cuong minh on 11/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class MonBacVC: UITableViewController {

    var data = Array<MonAn>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Món ăn Bắc"
        data.append(MonAn(name: "Phở Nam Định", description: "Phở Bò có nước dùng"))
        data.append(MonAn(name: "Bánh Cuốn Thanh Trì", description: "Có cà cuống"))

    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "#")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        let monAn = data[indexPath.row] as MonAn
        cell.textLabel.text = monAn.name
        cell.detailTextLabel?.text = monAn.description

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let monAnDetail = MonAnDetail(nibName: "MonAnDetail", bundle: nil)
        self.navigationController?.pushViewController(monAnDetail, animated: true)
        
    }
    

    
}
