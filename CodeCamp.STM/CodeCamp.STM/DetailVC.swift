//
//  DetailVC.swift
//  CodeCamp.STM
//
//  Created by ios26 on 11/23/14.
//  Copyright (c) 2014 ios26. All rights reserved.
//

import UIKit

class DetailVC: UITableViewController, ASValueTrackingSliderDataSource {

    var editMode: EditMode!
    var student: Student!
    var backButton: UIBarButtonItem?
    var saveButton : UIBarButtonItem?
    var cancelButton: UIBarButtonItem?
    
    @IBOutlet var fullName: UITextField!
    @IBOutlet var scoreSlide: ASValueTrackingSlider!
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreSlide.popUpViewCornerRadius = 12.0
        self.scoreSlide.setMaxFractionDigitsDisplayed(0)
        self.scoreSlide.popUpViewAnimatedColors = [UIColor(hue: 0.55, saturation: 0.8, brightness: 0.9, alpha: 0.7)]
        self.scoreSlide.font = UIFont(name: "GillSans-Bold", size: 22)
        self.scoreSlide.textColor = UIColor(hue: 0.55, saturation: 1.0, brightness: 0.5, alpha: 1)
        self.scoreSlide.dataSource = self
        self.navigationItem.leftBarButtonItem?
        saveButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "onSave")
        cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "onCancel")
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
        if editMode == EditMode.Edit{
            fullName.text = student.fullName
            scoreSlide.value = Float(student.score)
        }
        else{
            
        }
    }
    
    
    func slider(slider: ASValueTrackingSlider!, stringForValue value: Float) -> String! {
       let formatedValue = NSString(format: "%.1f", value)
        return formatedValue
    }
    
    
    func onSave(){
        if editMode == EditMode.AddNew{
            //add new item
            let newStudent = Student(name: fullName.text, photo: "noPhoto.gif", score: Double(scoreSlide.value))
            DataManager.singleton.students.addObject(newStudent)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        else{ //go back to main view
            self.student.fullName = self.fullName.text
            self.student.score = Double(self.scoreSlide.value)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    func onCancel(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

}

enum EditMode: Int{
    case AddNew, Edit
}

enum SortState: Int{
    case Asc, Desc
}
