//
//  TableViewController.swift
//  CuisineBook
//
//  Created by Khiem Ngo Viet on 11/16/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor =  UIColor(red:0.867, green:0.341, blue:0.478 ,alpha:1)
        
        let titleNav = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        titleNav.text = self.navigationItem.title
        titleNav.textColor = UIColor.whiteColor()
        titleNav.font = UIFont.boldSystemFontOfSize(20.0)
        titleNav.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = titleNav
        
        data.append(Item(coverImage: "Food1.jpg", profileImage: "Profile1.png", title: "Slow-Cooker Texas Chili", timeCook: "45 Minutes"))
        data.append(Item(coverImage: "Food2.jpg", profileImage: "Profile2.png", title: "Curried Sweet Potato Soup", timeCook: "1.30 Hours"))
        data.append(Item(coverImage: "Food3.jpg", profileImage: "Profile3.png", title: "Spinach and Goat Cheese Tartlets", timeCook: "90 Minutes"))
        data.append(Item(coverImage: "Food4.jpg", profileImage: "Profile4.png", title: "Vince's Ham-and-Cheese Croquettes", timeCook: "30 Minutes"))
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as TableViewCell
        let item = data[indexPath.row] as Item
        cell.coverImage = item.coverImage
        cell.profileImage = item.profileImage
        cell.title = item.title
        cell.timeCook = item.timeCook
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 260.0
    }
    
}
