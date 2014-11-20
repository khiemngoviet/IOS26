//
//  SearchTable.swift
//  DemoTable
//
//  Created by cuong minh on 11/17/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class SearchTable: AnimalVC, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {

    var searchBar: UISearchBar!
    var searchController: UISearchController!
    var searchResultsController: SearchResultController!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        searchResultsController = SearchResultController()
        //**** Gán tableView của searchResultsController vào ViewController này
        searchResultsController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false // default is YES
        searchController.searchBar.delegate = self
        //This is line is very important. Without it, app will hang !
        definesPresentationContext = true  //**** Critical

    }

    func initData() {
        animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu","Giraffe", "Greater Rhea","Hippopotamus", "Horse","Koala","Lion", "Llama", "Manatus", "Meerkat","Panda", "Peacock", "Pig", "Platypus", "Polar Bear","Rhinoceros", "Seagull", "Tasmania Devil","Whale", "Whale Shark", "Wombat"]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            let cellID = "id"
            var cell: UITableViewCell
            if let dequeCell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID) {
                cell = dequeCell as UITableViewCell
            } else {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
            let animal = animals[indexPath.row]
            cell.textLabel.text = animal
            cell.imageView.image = UIImage(named: getImageFileName(animal))
            return cell
    }
  
    // MARK: UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //Lấy ra tập các ký tự trắng, space
        let whitespaceCharacterSet = NSCharacterSet.whitespaceCharacterSet()
        
        //Loại bỏ các ký tự trắng ở hai đầu
        let strippedString = searchController.searchBar.text.stringByTrimmingCharactersInSet(whitespaceCharacterSet)
        
        //Hàm này sẽ tìm kiếm các phần tử mảng có chứa strippedString
        let searchResults = animals.filter {String($0).rangeOfString(strippedString, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil}
        //array.filter {... closure. $0 trỏ vào phần tử hiện thời}
        //rangeOfString tìm vị trí của một chuỗi con trong chuỗi cha, trả NSRange với NSString, còn String thì trả về Range
        
        //Gọi ra TableViewController hiển thị kết quả
        let resultsController = searchController.searchResultsController as SearchResultController
        
        //Truyền đoạn từ khoá tìm kiếm vào cho nó
        resultsController.searchText = strippedString
        
        //Truyền kết quả tìm kiếm vào
        resultsController.animals = searchResults
        
        //Làm tươi bảng kết quả
        resultsController.tableView.reloadData()     
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    //    if detailViewController == nil {
            //Nếu detailViewController chưa được khởi tạo thì sẽ khởi tạo
            detailViewController = DetailViewController()
    //    }
        
        if tableView == self.tableView {
            detailViewController.animal = animals[indexPath.row]
        } else {
            detailViewController.animal = searchResultsController.animals[indexPath.row]
        }
        // Note: Should not be necessary but current iOS 8.0 bug requires it.
        //tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow()!, animated: false)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}
