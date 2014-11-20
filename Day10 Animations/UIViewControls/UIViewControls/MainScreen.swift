//
//  MainScreen.swift
//  TechmasterSwiftApp
//
//  Created by Adam on 9/8/14.
//  Copyright (c) 2014 Adam. All rights reserved.
//

import UIKit

class MainScreen: UITableViewController {
    var description1:NSString!
    var about:NSString {
        get{
            return description1
        }
        set(about){
            self.description1 = NSString(format: "%@\n\n%@",about,"Written by Techmaster Vietnam ")
        }
        
    }
    
    var menu:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var barButoonItem = UIBarButtonItem(title: "About", style: UIBarButtonItemStyle.Plain, target: self, action: "onAbout")
        self.navigationItem.rightBarButtonItem = barButoonItem
        
    }
    
    func onAbout(){
        var aler = UIAlertView(title: "About", message: self.about, delegate: self, cancelButtonTitle: "Thank")
        aler.show()
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return menu.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var menuSection  = self.menu[section] as NSDictionary
        var menuArray = menuSection[MENU] as NSArray
        
        return menuArray.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var menuSection = self.menu[section]as NSDictionary
        return menuSection[SECTION]as NSString
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        var menuSection = self.menu[indexPath.section] as NSDictionary
        var menuItems = menuSection[MENU] as NSArray
        var item = menuItems[indexPath.row] as NSDictionary
        cell.textLabel.text = item[TITLE] as NSString
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var menuSection = self.menu[indexPath.section] as NSDictionary
        var menuItems = menuSection[MENU] as NSArray
        var item = menuItems[indexPath.row] as NSDictionary
        var xibClass = item[CLASS] as NSString
        var detailScreen: UIViewController!
        
        // check does not class exits
        let mainBundle = NSBundle.mainBundle()
        let info =  mainBundle.bundleIdentifier

        //let prodName = info["CFBundleName"]
        
        
        if let aClass = NSClassFromString("UIViewControls.\(xibClass)") as? UIViewController.Type{
            if (NSBundle.mainBundle().pathForResource(xibClass, ofType: "nib") == nil){
                //if the xib file does not exits
                detailScreen = aClass() as UIViewController
            }else{
                detailScreen = aClass(nibName:xibClass,bundle:nil) as UIViewController
                
            }
            detailScreen.title = item[TITLE] as? String
            self.navigationController!.pushViewController(detailScreen, animated: true)
            
        }else{
            var aler = UIAlertView(title: "Warning", message: "Please implement screen \(xibClass)", delegate: nil, cancelButtonTitle: "OK")
            aler.show()
        }
        
        
    }
    
}