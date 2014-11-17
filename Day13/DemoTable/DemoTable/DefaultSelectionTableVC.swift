//
//  DefaultSelectionTableVC.swift
//  DemoTable
//
//  Created by ios26 on 11/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class DefaultSelectionTableVC: UITableViewController {
    
    var data : NSMutableArray!
    var selectionData = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Lấy dữ liệu từ plist
        let path = NSBundle.mainBundle().pathForResource("TableData", ofType: "plist")
        data = NSMutableArray(contentsOfFile: path!)!
        if selectionData.count == 0{
            for item in data{
                selectionData.append(false)
            }
            self.setDefaultValue("Selection", value: selectionData)
        }
        else{
            selectionData = self.getDefaultValue("Selection") as [Bool]
        }
        tableView.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        let item: AnyObject = data[indexPath.row]
        cell.textLabel.text = item["text"] as? String
        let selectedData = selectionData[indexPath.row] as Bool
        
        cell.accessoryType = selectedData ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.None
    }
    
    func getDefaultValue(key:String) -> AnyObject?{
        var defaults = NSUserDefaults.standardUserDefaults()
        return defaults.valueForKey(key)
    }
    
    func setDefaultValue(key:String, value:AnyObject){
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(value, forKey: key)
        defaults.synchronize()
    }
    
    
}
