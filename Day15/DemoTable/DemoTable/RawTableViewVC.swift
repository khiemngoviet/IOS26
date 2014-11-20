//
//  RawTableViewVC.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class RawTableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["Banana", "Orange", "Lemon"]
    var tableView: UITableView?
    
    override func loadView() {
        super.loadView()
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.view.addSubview(tableView!)
        tableView!.delegate = self
        tableView!.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
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

}
