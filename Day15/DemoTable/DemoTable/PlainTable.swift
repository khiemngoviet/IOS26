//
//  PlainTable.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class PlainTable: UITableViewController {

    var data = ["Banana", "Orange", "Lemon"]

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "id"
        var cell: UITableViewCell
        if let dequeCell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID) {
            cell = dequeCell as UITableViewCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        cell.textLabel.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Table is selected at \(indexPath.row) - \(data[indexPath.row])")
    }
    
}
