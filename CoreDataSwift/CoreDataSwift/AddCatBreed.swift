//
//  AddCatBreed.swift
//  CoreDataSwift
//
//  Created by cuong minh on 12/4/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AddCatBreed: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var txtBreed: UITextField!
    @IBOutlet weak var originCountry: UIPickerView!
    let countries = ["Australia", "Brazil", "Burma", "China", "Egypt", "France", "Great Britain", "Greece", "Japan", "Russia","Thailand", "United States"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add new cat breed"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "onSave")
        originCountry.delegate = self
        originCountry.dataSource = self
    }
    //MARK:- Handle
    func onSave() {
        let managedContext = DataManager.singleton.managedObjectContext!
        CatBreed.add(txtBreed.text, originCountry: countries[originCountry.selectedRowInComponent(0)])

        var saveError: NSError?
        if !managedContext.save(&saveError) {
            //Alert
        } else {
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    //MARK:- UIPickerViewDataSource, UIPickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return countries.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return countries[row]
    }



}
