//
//  StudentListVC.swift
//  CodeCamp.STM
//
//  Created by ios26 on 11/23/14.
//  Copyright (c) 2014 ios26. All rights reserved.
//

import UIKit

class StudentListVC: UITableViewController, UISearchDisplayDelegate, UISearchControllerDelegate {
    
    
    @IBOutlet var searchController: UISearchDisplayController!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentFilter: UISegmentedControl!
    
    let rowHeight:CGFloat = 72
    var sortState:SortState = SortState.Asc
    
    
    
    var students : NSMutableArray!
    var filteredStudents = [Student]()
    
    var sortButton: UIBarButtonItem!
    var addButton: UIBarButtonItem!
    var deleteButton : UIBarButtonItem?
    var doneButton : UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortButton = self.navigationItem.leftBarButtonItem
        addButton = self.navigationItem.rightBarButtonItem
        deleteButton = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "onDelete")
        deleteButton?.tintColor = UIColor.redColor()
        doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "onDone")
        self.tableView.rowHeight = rowHeight
        self.tableView.allowsMultipleSelectionDuringEditing = true
        self.tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let longPress = UILongPressGestureRecognizer(target: self, action: "onLongPressTableView:")
        longPress.minimumPressDuration = 0.7
        self.tableView.addGestureRecognizer(longPress)
        initData()
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.sortData()
        self.tableView.reloadData()
    }
    
    func initData() {
        students = DataManager.singleton.students
        students.addObject(Student(name: "Kim Jong Un",photo: "Photo01.jpg", score: 10))
        students.addObject(Student(name: "Michael Smith",photo: "Photo02.jpg", score: 9.0))
        students.addObject(Student(name: "James Rock",photo: "Photo03.jpg", score: 8.0))
        students.addObject(Student(name: "Anthony Gianakas",photo: "Photo04.jpg", score: 5.0))
        students.addObject(Student(name: "Edward Pauley",photo: "Photo05.jpg", score: 6.0))
        students.addObject(Student(name: "Diana Rose",photo: "Photo06.jpg", score: 8.0))
        students.addObject(Student(name: "Maria Hernandez",photo: "Photo07.jpg", score: 5.0))
        students.addObject(Student(name: "Nikki Bisel",photo: "Photo08.jpg", score: 10))
        students.addObject(Student(name: "Andrew Sinclair",photo: "Photo09.jpg", score: 9.0))
        students.addObject(Student(name: "John Smith",photo: "Photo10.jpg", score: 7.0))
        self.sortData()
    }
    
    func sortData(){
        var key = segmentFilter.selectedSegmentIndex == 0 ? "fullName" : "score"
        let sorter = NSSortDescriptor(key: key, ascending: sortState == SortState.Asc ? true : false)
      self.students.sortUsingDescriptors([sorter])
    }
    
    
    @IBAction func onSortTouch(sender: UIBarButtonItem) {
        if sortState == SortState.Asc{
            sender.image = UIImage(named: "SortDesc")
            self.sortState = SortState.Desc
            self.sortData()
        }
        else{
            sender.image = UIImage(named: "SortAsc")
            self.sortState = SortState.Asc
            self.sortData()
        }
        self.tableView.reloadData()
    }
    
    @IBAction func onSegmentValueChanged(sender: UISegmentedControl) {
        self.sortData()
        self.tableView.reloadData()
    }
    
    
    func filterContentForSearchText(searchText: String) {
        let whitespaceCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        //Loại bỏ các ký tự trắng ở hai đầu
        let strippedString = searchText.stringByTrimmingCharactersInSet(whitespaceCharacterSet)
        //Hàm này sẽ tìm kiếm các phần tử mảng có chứa strippedString
        let resultPredicate = NSPredicate(format: "fullName contains[c] %@", strippedString)
        self.filteredStudents = self.students.filteredArrayUsingPredicate(resultPredicate!) as [Student]
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    
    
    @IBAction func onAdd(sender: UIBarButtonItem) {
        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as DetailVC
        detailVC.editMode = EditMode.AddNew
        self.navigateDetail(detailVC)
    }
    
    
    
    
    func navigateDetail(detailVC: DetailVC){
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func onDelete(){
        let selectedIndexPaths = self.tableView.indexPathsForSelectedRows()
        if selectedIndexPaths?.count > 0 {
            var refreshAlert = UIAlertController(title: "", message: "Are you sure you want to delete selected items?", preferredStyle: UIAlertControllerStyle.Alert)
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
                //Delete selected items
                for selectedIndexPath in selectedIndexPaths as Array<NSIndexPath>{
                    self.students.removeObjectAtIndex(selectedIndexPath.row)
                }
                self.tableView.deleteRowsAtIndexPaths(selectedIndexPaths!, withRowAnimation: UITableViewRowAnimation.Fade)
            }))
            refreshAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
                //just do nothing
            }))
            presentViewController(refreshAlert, animated: true, completion: nil)
        }
    }
    
    func onDone(){
        self.tableView.setEditing(!self.tableView.editing, animated: true)
        self.navigationItem.leftBarButtonItem = sortButton
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func onLongPressTableView(longPressGes: UILongPressGestureRecognizer){
        if !self.tableView.editing{
            let point = longPressGes.locationInView(self.tableView)
            let indexPath = self.tableView.indexPathForRowAtPoint(point)
            if indexPath != nil && longPressGes.state == UIGestureRecognizerState.Began{
                self.navigationItem.rightBarButtonItem = doneButton
                self.navigationItem.leftBarButtonItem = deleteButton
                self.tableView.setEditing(!self.tableView.editing, animated: true)
                self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
            }
        }
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredStudents.count
        } else {
            return self.students.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.rowHeight = rowHeight
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as TableViewCell
        var student:Student
        if tableView == self.searchDisplayController!.searchResultsTableView {
            student = filteredStudents[indexPath.row]
        } else {
            student = students[indexPath.row] as Student
        }
        
        cell.photoProfile.image = student.photo
        cell.fullName.text = student.fullName
        let formatedValue = NSString(format: "%.1f", student.score)
        cell.score.text = formatedValue
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.976, green:0.976, blue:0.976, alpha:1)
        }
        else{
            cell.backgroundColor = UIColor.whiteColor()
            
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if !tableView.editing{
            let student = students[indexPath.row] as Student
            let detailVC = storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as DetailVC
            detailVC.student = student
            detailVC.editMode = EditMode.Edit
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
}
