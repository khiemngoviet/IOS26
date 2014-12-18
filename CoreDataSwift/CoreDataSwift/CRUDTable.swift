//
//  CRUDTable.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import CoreData
class CRUDTable: UITableViewController, NSFetchedResultsControllerDelegate {
    var fetchResultController: NSFetchedResultsController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "onEdit"), UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "onAdd")]
        
        let sortOriginAZ = NSSortDescriptor(key: "originCountry", ascending: true)
        let sortNameAZ = NSSortDescriptor(key: "breed", ascending: true)
        fetchResultController = CatBreed.createFetchResultsController([sortOriginAZ, sortNameAZ], sectionKey: "originCountry")
        fetchResultController.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        var error: NSError?
        NSFetchedResultsController.deleteCacheWithName("root")
        fetchResultController.performFetch(&error)
        if error != nil {
            println("\(error?.description)  - \(error?.debugDescription)")
        }
    }
    
    func onEdit() {
        tableView.setEditing(!tableView.editing, animated: true)
    }
    
    func onAdd() {
        let addCatBreed = AddCatBreed(nibName: "AddCatBreed", bundle: nil)
        navigationController?.pushViewController(addCatBreed, animated: true)
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchResultController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchResultController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "#")
        }
        let catBreed = fetchResultController.objectAtIndexPath(indexPath) as CatBreed
        cell.textLabel?.text = catBreed.breed
        cell.detailTextLabel?.text = catBreed.originCountry
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = fetchResultController.sections![section] as NSFetchedResultsSectionInfo
        let sectionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        sectionLabel.text = section.name
        sectionLabel.font = UIFont (name: "Helvetica Neue", size: 18)
        sectionLabel.backgroundColor = UIColor.grayColor()
        return sectionLabel
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
//            println("\(indexPath.section) - \(indexPath.row)")
            
            let catBreedToBeDelete = fetchResultController.objectAtIndexPath(indexPath) as CatBreed
            DataManager.singleton.managedObjectContext?.deleteObject(catBreedToBeDelete)
            DataManager.singleton.saveContext()
        } else if editingStyle == .Insert {

        }
    }
    //MARK:- NSFetchedResultsControllerDelegate
    //http://fruitstandsoftware.com/blog/2013/02/19/uitableview-and-nsfetchedresultscontroller-updates-done-right/
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch (type) {
            case .Insert:
                println("Insert")
            case .Delete:
                tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            case .Update:
                tableView.cellForRowAtIndexPath(indexPath!)
            case .Move:
                tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
                tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Automatic)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
        default:
            return
        }
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }

}
