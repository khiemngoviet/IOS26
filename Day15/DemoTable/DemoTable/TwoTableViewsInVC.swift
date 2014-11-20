//
//  TwoTableViewsInVC.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class TwoTableViewsInVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableA, tableB: UITableView?
    var fruits = ["Banana", "Orange", "Lemon"]
    var things = ["Clock", "Guitar", "Tivi", "Wash Machine"]

    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        
        tableA = UITableView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.5), style: UITableViewStyle.Plain)
        self.view.addSubview(tableA!)
        tableA!.delegate = self
        tableA!.dataSource = self
        
        
        tableB = UITableView(frame: CGRect(x: 0, y: size.height * 0.5, width: size.width, height: size.height * 0.5), style: UITableViewStyle.Plain)
        self.view.addSubview(tableB!)
        tableB!.delegate = self
        tableB!.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tableA {
            return fruits.count
        } else {
            return things.count
        }
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
        if tableView == tableA {
            cell.textLabel.text = fruits[indexPath.row]
        } else {
            cell.textLabel.text = things[indexPath.row]
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        
        return cell
    }

}
