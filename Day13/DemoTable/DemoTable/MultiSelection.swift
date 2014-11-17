//
//  MultiSelection.swift
//  DemoTable
//
//  Created by cuong minh on 11/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class MultiSelection: UITableViewController {

    var data : NSMutableArray!
    var deleteButton : UIBarButtonItem?
    var backBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "onEdit")
        
        
        deleteButton = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "onDelete")
        //Lưu tam nút back bar button item
        backBarButtonItem = self.navigationItem.leftBarButtonItem
        
        //Dòng này cực quan trọng, nó cho phép bật chế độ multiple selection
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        data = NSMutableArray(capacity: 20)
        for var i = 0; i<20; i++ {
            data.addObject(Person())
        }
    }
    
    func onEdit() {
        if self.tableView.editing {
            self.tableView.setEditing(false, animated: true)
            self.navigationItem.leftBarButtonItem = backBarButtonItem
        } else {
            self.tableView.setEditing(true, animated: true)
            self.navigationItem.leftBarButtonItem = deleteButton
        }
    }
    
    func onDelete() {
        if let selectedRows = self.tableView.indexPathsForSelectedRows() {
            if selectedRows.count > 0 {
                let indicesOfItemsToDelete = NSMutableIndexSet()
                for selectedIndex in selectedRows {
                    indicesOfItemsToDelete.addIndex(selectedIndex.row)
                }
                data.removeObjectsAtIndexes(indicesOfItemsToDelete)
                self.tableView.deleteRowsAtIndexPaths(selectedRows, withRowAnimation: UITableViewRowAnimation.Automatic)
            }            
        }
        
    }


    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "#")
        }
        let person = data[indexPath.row] as Person
        cell.textLabel.text = person.name
        cell.detailTextLabel?.text = "\(person.age)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }*/
    

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
