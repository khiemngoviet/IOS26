//
//  UseObjcLib.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class UseObjcLib: ConsoleScreen, NSURLSessionDelegate {
    //http://www.raywenderlich.com/67081/cookbook-using-nsurlsession
    override func viewDidLoad() {
        super.viewDidLoad()
        let sessionConnection = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

        let dataTask = sessionConnection.dataTaskWithURL(NSURL(string: "http://www.shoutcast.com/")!, completionHandler: { (data, response, error) -> Void in
                let string = NSString(data: data, encoding: NSUTF8StringEncoding)!
                let document = HTMLDocument(string: string)

                dispatch_async(dispatch_get_main_queue()){
                    self.getGenresList(document)
                }
            
        })
        
        dataTask.resume()

    }
    
    func getGenresList(document: HTMLDocument){
        let mainGenres = document.nodesMatchingSelector("aside#sidebar > ul > li")
        for liNode in mainGenres {
            let sectionGenre = (liNode as HTMLElement).firstNodeMatchingSelector("li > a")
            self.writeln("\(sectionGenre.textContent)")
        }
    }
    

}

