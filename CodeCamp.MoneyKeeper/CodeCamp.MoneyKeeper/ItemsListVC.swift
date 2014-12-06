//
//  ItemsVC.swift
//  CodeCamp.MoneyKeeper
//
//  Created by Khiem Ngo Viet on 12/5/14.
//  Copyright (c) 2014 Khiem Ngo Viet. All rights reserved.
//

import UIKit
import CoreData

class ItemsListVC: UITableViewController, NSFetchedResultsControllerDelegate, UISearchDisplayDelegate, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    var editBarItem: UIBarButtonItem!
    var doneBarItem: UIBarButtonItem!
    
    var fetchResultController: NSFetchedResultsController!
    let rowHeight:CGFloat = 51
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editBarItem = self.navigationItem.leftBarButtonItem
        self.doneBarItem = UIBarButtonItem(title: "Xong", style: UIBarButtonItemStyle.Plain, target: self, action: "onDone")
        self.tableView.rowHeight = rowHeight
        self.tableView.registerNib(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let sortdatedesc = NSSortDescriptor(key: "date", ascending: false)
        fetchResultController = Item.createFetchResultsController([sortdatedesc],sectionKey: nil, queryString: nil)
        fetchResultController.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        var error: NSError?
        NSFetchedResultsController.deleteCacheWithName("root")
        fetchResultController.performFetch(&error)
        if error != nil {
            println("\(error?.description)  - \(error?.debugDescription)")
        }
        self.computeSum()
    }
    
    
    @IBAction func onEdit(sender:UIBarButtonItem) {
        tableView.setEditing(!tableView.editing, animated: true)
        self.navigationItem.leftBarButtonItem = doneBarItem
    }
    
    func onDone(){
        self.navigationItem.leftBarButtonItem = editBarItem
        tableView.setEditing(!tableView.editing, animated: true)
    }
    
    @IBAction func onAdd(sender: UIBarButtonItem) {
        let itemDetail = self.storyboard?.instantiateViewControllerWithIdentifier("ItemDetail") as ItemDetailVC
        itemDetail.editMode = EditMode.AddNew
        self.navigationController?.pushViewController(itemDetail, animated: true)
    }
    
    func computeSum(){
        var sum:NSDecimalNumber = 0
        let accounts = Account.all() as [Account]
        for account in accounts{
            sum = sum.decimalNumberByAdding(account.currentAmount)
        }
        self.navigationItem.title = "Còn: \(NSNumberFormatter.stringFromCurrency(sum))"
    }
    
    func doFilter(searchString: String){
        NSFetchedResultsController.deleteCacheWithName("root")
        let sortdatedesc = NSSortDescriptor(key: "date", ascending: false)
        var queryString:String? = countElements(searchString) > 0 ? "category.name contains[cd] '\(searchString)'" : nil
        fetchResultController = Item.createFetchResultsController([sortdatedesc],sectionKey: nil, queryString: queryString )
        fetchResultController.delegate = self
        fetchResultController.performFetch(nil)
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.doFilter(searchString)
        return true
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.doFilter("")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchResultController.fetchedObjects?.count
        return count!
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as ItemCell
        let item = fetchResultController.objectAtIndexPath(indexPath) as Item
        if item.category.isIncome.boolValue{
            cell.item.textColor = UIColor(red: 0, green:0.478, blue:1, alpha:1)
            cell.amount.textColor = UIColor(red: 0, green:0.478, blue:1, alpha:1)
        }
        else{
            cell.item.textColor = UIColor.blackColor()
            
        }
        cell.item.text = item.category.isIncome.boolValue ? "Thu: \(item.category.name)" : "Chi: \(item.category.name)"
        cell.amount.text = NSNumberFormatter.stringFromCurrency(item.amount)
        cell.date.text = NSDate.convertToString(item.date)
        cell.account.text = item.account.name
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = fetchResultController.objectAtIndexPath(indexPath) as Item
            self.compute(item)
            DataManager.singleton.managedObjectContext?.deleteObject(item)
            DataManager.singleton.saveContext()
        } else if editingStyle == .Insert {
            
        }
    }
    
    func compute(item:Item){
        let account = Account.query("name == '\(item.account.name)'", sortDescriptors: nil).0?.first as Account
        if item.category.isIncome.boolValue { //Thu
            account.currentAmount = account.currentAmount.decimalNumberBySubtracting(item.amount)
        }
        else{ //Chi
            account.currentAmount = account.currentAmount.decimalNumberByAdding(item.amount)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if !tableView.editing{
            let item = fetchResultController.objectAtIndexPath(indexPath) as Item
            let detailVC = storyboard?.instantiateViewControllerWithIdentifier("ItemDetail") as ItemDetailVC
            detailVC.item = item
            detailVC.editMode = EditMode.Edit
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    
    
    
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
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as ItemCell
            let item = fetchResultController.objectAtIndexPath(indexPath!) as Item
            cell.item.text = item.category.isIncome.boolValue ? "Thu: \(item.category.name)" : "Chi: \(item.category.name)"
            cell.amount.text = "\(item.amount)"
            cell.date.text = NSDate.convertToString(item.date)
            cell.account.text = item.account.name
            if item.category.isIncome.boolValue{
                cell.item.textColor = UIColor(red: 0, green:0.478, blue:1, alpha:1)
                cell.amount.textColor = UIColor(red: 0, green:0.478, blue:1, alpha:1)
            }
            else{
                cell.item.textColor = UIColor.blackColor()
                cell.amount.textColor = UIColor.blackColor()
            }
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
        self.computeSum()
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

enum EditMode: Int{
    case AddNew, Edit
}

enum CategoryType: Int{
    case Expense, Income
}
