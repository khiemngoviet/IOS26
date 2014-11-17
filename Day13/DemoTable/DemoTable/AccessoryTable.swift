//
//  AccessoryTable.swift
//  DemoTable
//
//  Created by cuong minh on 11/6/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AccessoryTable: UITableViewController {
    var data : NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Lấy dữ liệu từ plist
        let path = NSBundle.mainBundle().pathForResource("TableData", ofType: "plist")
        data = NSMutableArray(contentsOfFile: path!)!
       /* for item in data {
            let text = item["text"] as String
            println("\(text)")
        }*/
    }


    // MARK: - Table view data source
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
     
        //2. khởi tạo custom accessoryView       
        let accessoryView = CustomCheck(noncheck: UIImage(named: "circle")!, check: UIImage(named: "circlecheck")!)
        accessoryView.checked = item["checked"] as Bool
   
        
        //3. hứng tương tác đa chạm
        accessoryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onAccessoryTap:"))

        //4. gán vào UITableViewCell.accessoryView
        cell.accessoryView = accessoryView

        return cell
    }
    func toogleCheck (indexPath: NSIndexPath) {
        let item: NSMutableDictionary = data[indexPath.row] as NSMutableDictionary
        item["checked"] = !(item["checked"] as Bool)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            (cell.accessoryView as CustomCheck).checked = item["checked"] as Bool
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toogleCheck(indexPath)
    }
    

    /*
    The delegate usually responds to the tap on the disclosure button (the accessory view) by displaying a new view related to the selected row. This method is not called when an accessory view is set for the row at indexPath.
    */
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        println("tap")
    }
    
    func onAccessoryTap(tap: UITapGestureRecognizer) {
        let tapPosition = tap.locationInView(self.tableView)
        // Lookup the index path of the cell whose checkbox was modified.
        if let indexPath = self.tableView.indexPathForRowAtPoint(tapPosition) {
            println("\(indexPath.row)")
            toogleCheck(indexPath)
        }
        //self.tableView.reloadData()
    }

}
