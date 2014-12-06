//
//  DataManager.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/3/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import Foundation
import CoreData
private let _dataManager = DataManager()

class DataManager  {
    class var singleton : DataManager {
        return _dataManager
    }
    private var _modelName: String = "Model"
    var modelName: String {
        get {
            if countElements(_modelName)==0 {
                let mainBundle = NSBundle.mainBundle()
                let info =  mainBundle.infoDictionary as NSDictionary?
                _modelName = info!.objectForKey("CFBundleName") as String
            }
            return _modelName
        }
    }
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.exteam.CodeCamp_MoneyKeeper" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as NSURL
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("CodeCamp_MoneyKeeper", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("CodeCamp_MoneyKeeper.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }
    
    //MARK:- Utility Function
    //Remove sqlite file
    func hardReset() {
        let filemanager = NSFileManager.defaultManager()  //Khởi tạo trình quản lý file, singleton
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("/CodeCamp_MoneyKeeper.sqlite")
        var error: NSError? = nil
        filemanager.removeItemAtURL(url, error: &error)
    }
    //Copy sqlite from Main
    func copyFromBundleToDocument() -> Bool {
        let filemanager = NSFileManager.defaultManager()  //Khởi tạo trình quản lý file, singleton
        //Lấy ra thư mục Document của app. Không cần phải nhớ, quên thì vào đây mà Copy and Paste!
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        
        let destinationPath:NSString = documentsPath.stringByAppendingString("/CodeCamp_MoneyKeeper.sqlite")
        
        if !filemanager.fileExistsAtPath(destinationPath){
            //Copy from mainBundle to Document folder
            let fileForCopy = NSBundle.mainBundle().pathForResource("CodeCamp_MoneyKeeper",ofType:"sqlite")
            if !filemanager.fileExistsAtPath(fileForCopy!) {
                return false
            }
            return filemanager.copyItemAtPath(fileForCopy!,toPath:destinationPath, error: nil)
        } else{
            return true
        }
    }
    
    func hasDataBaseFile() -> Bool{
        let filemanager = NSFileManager.defaultManager()  //Khởi tạo trình quản lý file, singleton
        //Lấy ra thư mục Document của app. Không cần phải nhớ, quên thì vào đây mà Copy and Paste!
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        let destinationPath:NSString = documentsPath.stringByAppendingString("/CodeCamp_MoneyKeeper.sqlite")
        if !filemanager.fileExistsAtPath(destinationPath){
            return true
        } else{
            return false
        }
    }
    
    func initData(){
        //Category
        let managedContext = DataManager.singleton.managedObjectContext!
        //OutCome
        Category.add("Điện", parent: "Dịch vụ sinh hoạt", description: "", isIncome: false)
        Category.add("Nước", parent: "Dịch vụ sinh hoạt", description: "", isIncome: false)
        Category.add("Gas", parent: "Dịch vụ sinh hoạt", description: "", isIncome: false)
        Category.add("Internet", parent: "Dịch vụ sinh hoạt", description: "", isIncome: false)
        Category.add("Điện thoại di động", parent: "Dịch vụ sinh hoạt", description: "", isIncome: false)
        
        Category.add("Ăn tiệm", parent: "Ăn uống", description: "", isIncome: false)
        Category.add("Cafe", parent: "Ăn uống", description: "", isIncome: false)
        
        Category.add("Xăng xe", parent: "Đi lại", description: "", isIncome: false)
        Category.add("Gửi xe", parent: "Đi lại", description: "", isIncome: false)
        
        Category.add("Quần áo", parent: "Mua sắm", description: "", isIncome: false)
        Category.add("Giầy dép", parent: "Mua sắm", description: "", isIncome: false)

        
        //InCome
        Category.add("Lương", parent: "", description: "", isIncome: true)
        Category.add("Thưởng", parent: "", description: "", isIncome: true)
        //Account
        Account.add("Ví", originAmount: 0, currentAmount: 0)
        Account.add("ATM", originAmount: 0, currentAmount: 0)
        
        var saveError: NSError?
        if !managedContext.save(&saveError) {
            
        }
    }
    
    
    
    
}