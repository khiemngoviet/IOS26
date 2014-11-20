//
//  SearchResultController.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class SearchResultController: AnimalVC {
    var searchText: String? //Lưu chuỗi cần tìm kiếm
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "id"
        var cell: UITableViewCell
        if let dequeCell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID) {
            cell = dequeCell as UITableViewCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        //Lấy ra từng phần tử của mảng kết quả trả về
        let animal = animals[indexPath.row]
        
        if let searchStr = searchText {
            //NSMutableAttributedString là chuỗi có thể định dạng hiển thị: màu chữ, màu nền, font chữ, kích thước, bold, italic, underline, stroke...
            var attributedText = NSMutableAttributedString(string: animal)
            
            let range = (animal as NSString).rangeOfString(searchStr, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            attributedText.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: range)

            /* Bug with NSBackgroundColorAttributeName
            attributedText.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range:range) */
            
            cell.textLabel.attributedText = attributedText
            
        } else {
            cell.textLabel.text = animal
        }
        cell.imageView.image = UIImage(named: getImageFileName(animal))
        return cell
    }

}
