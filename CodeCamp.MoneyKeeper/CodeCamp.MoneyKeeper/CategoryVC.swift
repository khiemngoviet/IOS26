//
//  CategoryVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit
import CoreData
class CategoryVC: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var fetchResultController: NSFetchedResultsController!
    var category: Category?
    var categoryType: CategoryType!
    var delegate: CategorySelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Sửa", style: UIBarButtonItemStyle.Plain, target: self, action: "onEdit"), UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "onAdd")]
        self.title = self.categoryType == CategoryType.Income ? "Mục Thu" : "Mục Chi"
        
        let sortParentAZ = NSSortDescriptor(key: "parent", ascending: false)
        let sortNameAZ = NSSortDescriptor(key: "name", ascending: false)
        
        var query = self.categoryType == CategoryType.Income ? "parent == ''" : "parent != ''"
        
        fetchResultController = Category.createFetchResultsController([sortParentAZ,sortNameAZ], sectionKey: "parent", queryString: query)
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
        let categoryDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("CategoryDetail") as CategoryDetailVC
        categoryDetailVC.editMode = EditMode.AddNew
        categoryDetailVC.categoryType = self.categoryType
        self.navigationController?.pushViewController(categoryDetailVC, animated: true)
    }
    
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
        let category = fetchResultController.objectAtIndexPath(indexPath) as Category
        cell.textLabel?.text = category.name
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
        if self.categoryType == CategoryType.Expense{
            return 30.0
        }
        else{
            return 0.0
        }
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //            println("\(indexPath.section) - \(indexPath.row)")
            
            let category = fetchResultController.objectAtIndexPath(indexPath) as Category
            DataManager.singleton.managedObjectContext?.deleteObject(category)
            DataManager.singleton.saveContext()
        } else if editingStyle == .Insert {
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        if parent == nil{ //Back to root view
            let indexPath: NSIndexPath? = self.tableView.indexPathForSelectedRow()
            if indexPath != nil{
                var category = self.fetchResultController.objectAtIndexPath(indexPath!) as Category
                self.delegate.onSelectedCategory(category)
            }
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
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
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
