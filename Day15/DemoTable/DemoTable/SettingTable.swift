//
//  SettingTable.swift
//  DemoTable
//
//  Created by cuong minh on 11/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class SettingTable: UITableViewController {
    var data = Array<SettingEntry>()
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(SettingEntry(noncheck: UIImage(named: "wifioff")!, check: UIImage(named: "wifion")!, noncheckTitle: "Wifi is off", checkTitle: "Wifi is on"))
        data.append(SettingEntry(noncheck: UIImage(named: "localstore")!, check: UIImage(named: "cloud")!, noncheckTitle: "Store data locally", checkTitle: "Store data on cloud"))
 
    }



    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        let cellID  = "#"
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell! {
            cell = dequeCell
        } else  {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        let item = data[indexPath.row] as SettingEntry
        if item.checked {
            cell.textLabel.text = item.checkTitle
        } else {
            cell.textLabel.text = item.noncheckTitle
        }
        
        //2. khởi tạo custom accessoryView
        let accessoryView = CustomCheck(noncheck: item.noncheckImage, check: item.checkImage)
        accessoryView.checked = item.checked
        
        
        //3. hứng tương tác đa chạm
        accessoryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onAccessoryTap:"))
        
        //4. gán vào UITableViewCell.accessoryView
        cell.accessoryView = accessoryView
        
        return cell
    }
    func toogleCheck (indexPath: NSIndexPath) {
        let item = data[indexPath.row] as SettingEntry
        item.checked = !item.checked
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            (cell.accessoryView as CustomCheck).checked = item.checked
            if item.checked {
                cell.textLabel.text = item.checkTitle
            } else {
                cell.textLabel.text = item.noncheckTitle
            }
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toogleCheck(indexPath)
    }

    
    func onAccessoryTap(tap: UITapGestureRecognizer) {
        let tapPosition = tap.locationInView(self.tableView)
        // Lookup the index path of the cell whose checkbox was modified.
        if let indexPath = self.tableView.indexPathForRowAtPoint(tapPosition) {
            toogleCheck(indexPath)
        }
    }


}
