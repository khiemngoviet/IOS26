//
//  WritePlist.swift
//  CoreDataSwift
//
//  Created by techmaster on 12/1/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class WritePlist: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileinDocument = pathToFile("Array.plist") {
            if let celebrities = NSMutableArray(contentsOfFile: fileinDocument) {
                celebrities.addObject(["name": "Trinh Minh Cuong", "job": "programmer"])
                celebrities.addObject(["name": "Barak Obama", "job": "President"])
                celebrities.writeToFile(fileinDocument, atomically: true)
            }
            
            
            if let celebrities = NSArray(contentsOfFile: fileinDocument) {
                for item in celebrities {
                    let celeb = item as NSDictionary
                    let name = celeb["name"] as String
                    let job = celeb["job"] as String
                    self.writeln("\(name) - \(job)")
                }
            }
        }

    }
    //I copied code from this http://stackoverflow.com/questions/24055146/how-to-find-nsdocumentdirectory-in-swift
    //source must be this format fileName.fileType
    func pathToFile(source: String)->String? {
        //tách string thành array
        var fileSource = source.componentsSeparatedByString(".")
        if fileSource.count != 2 {
            return nil
        }
        let filemanager = NSFileManager.defaultManager()  //Khởi tạo trình quản lý file, singleton
        //Lấy ra thư mục Document của app. Không cần phải nhớ, quên thì vào đây mà Copy and Paste!
        let documentsPath : AnyObject = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)[0]
        
        let destinationPath:NSString = documentsPath.stringByAppendingString("/\(source)")
        
        if(!filemanager.fileExistsAtPath(destinationPath) ){
            //Copy from mainBundle to Document folder
            let fileForCopy = NSBundle.mainBundle().pathForResource(fileSource[0],ofType:fileSource[1])
            filemanager.copyItemAtPath(fileForCopy!,toPath:destinationPath, error: nil)
            return destinationPath
        }
        else{
            return destinationPath
        }
    }
}
