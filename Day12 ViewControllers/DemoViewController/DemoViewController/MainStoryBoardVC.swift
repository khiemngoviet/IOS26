//
//  SB_VCA.swift
//  DemoViewController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class MainStoryBoardVC: UITableViewController {

    let viewTransitionDelegate = TransitionDelegate()
    @IBAction func onClose(sender: UIBarButtonItem) {        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CustomTransition" {
            let destinationViewController = segue.destinationViewController as CustomTransitionDestinationVC
            destinationViewController.transitioningDelegate = viewTransitionDelegate
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 6 {
            self.performSegueWithIdentifier("PresentModally", sender: self)
        }
    }

}
