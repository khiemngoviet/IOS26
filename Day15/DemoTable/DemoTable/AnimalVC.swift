//
//  AnimalVC.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AnimalVC: UITableViewController {
    var animals:[String]!
    var detailViewController: DetailViewController!

    // MARK: - Share functions
    func getImageFileName(animal: String) -> String {
        var imageFileName = animal.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_")
        imageFileName += ".jpg"
        return imageFileName
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
    }
    


}
