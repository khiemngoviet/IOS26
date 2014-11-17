//
//  PlainTable.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class PlainTable: UITableViewController {
    
    //var data = ["Banana", "Orange", "Lemon"]
    var data = [Item]()
    
    override func viewDidLoad() {
        data.append(Item(name: "Banana", description: "Chuoi"))
        data.append(Item(name: "Orange", description: "Cam"))
        data.append(Item(name: "Lemon", description: "Chanh"))
        
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "id"
        var cell: UITableViewCell
        if let dequeCell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID) {
            cell = dequeCell as UITableViewCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        //cell.imageView = UIImageView(image: UIImage(named: "KateUpton.jpg"))
        let item = data[indexPath.row] as Item
        cell.textLabel.text = item.name
        cell.detailTextLabel?.text = item.description
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Table is selected at \(indexPath.row) - \(data[indexPath.row])")
    }
    

}

class Item{
    var name:String
    var description:String
    
    init(name:String, description:String){
        self.name = name
        self.description = description
    }
}
