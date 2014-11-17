//
//  CustomCellDemo.swift
//  DemoTable
//
//  Created by cuong minh on 11/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class CustomCellDemo: UITableViewController {

    let cellID = "#"
    var data = Array<Poster>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CustomCell", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        initData()
    }
    func initData() {
        data.append(Poster(title: "Clint Eastwood", imagePath: "clint.jpg", score: 6.3))
        data.append(Poster(title: "Kill Bill", imagePath: "kill-bill.jpg", score: 5))
        data.append(Poster(title: "Marilyn Monroe", imagePath: "marilyn.jpg", score: 8))
        data.append(Poster(title: "Taxi Driver", imagePath: "taxi-driver.jpg", score: 5))
        data.append(Poster(title: "Pulp Finction", imagePath: "pulp-fiction.jpg", score: 9))
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CustomCell!
        
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as? CustomCell {
            cell = dequeCell
        }
        let poster = data[indexPath.row]
        cell.title.text = poster.title
        cell.thumb.image = poster.image
        cell.score.text = "\(poster.score)"
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

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
