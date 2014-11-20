//
//  VictoriaSecret.swift
//  DemoTable
//
//  Created by cuong minh on 11/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class VictoriaSecret: UITableViewController {

    var data: Array<VictoriaModel> = Array<VictoriaModel>()
    
    override func loadView() {
        super.loadView()
        data.append(VictoriaModel(name: "Kate Upton", thumbStr: "KateUpton0.jpg"))
        data.append(VictoriaModel(name: "Adriana Lima", thumbStr: "AdrianaLima0.jpg"))
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
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        let victoriaModel = data[indexPath.row] as VictoriaModel
        cell.textLabel.text = victoriaModel.name
        cell.imageView.image = victoriaModel.thumb
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    
}
