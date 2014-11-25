//
//  DetailVC.swift
//  CodeCamp.STM
//
//  Created by ios26 on 11/23/14.
//  Copyright (c) 2014 ios26. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    
    @IBOutlet var firstName: CustomTextField!
    @IBOutlet var lastName: CustomTextField!
    @IBOutlet var score: CustomTextField!
    @IBOutlet var birthDate: CustomTextField!
    @IBOutlet var address: CustomTextField!
    @IBOutlet var email: CustomTextField!
    @IBOutlet var phone: CustomTextField!
    
    
    var editMode: EditMode!
    var student: Student!
    var backButton: UIBarButtonItem?
    var saveButton : UIBarButtonItem?
    var cancelButton: UIBarButtonItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        self.firstName.required = true
        self.lastName.required = true
        self.score.required = true
        self.birthDate.isDateField = true
        self.navigationItem.leftBarButtonItem?
        saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "onSave")
        cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "onCancel")
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
        if editMode == EditMode.Edit{
            self.fillForm()
        }
    }
    
    

    
    
    func onSave(){
        if validateInput(self.view){
            if editMode == EditMode.AddNew{
                self.collectData()
                DataManager.singleton.students.addObject(student)
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            else{ //go back to main view
                self.collectData()
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
        }
    }
    
    func onCancel(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    func fillForm(){
        firstName.text = student.firstName
        lastName.text = student.lastName
        score.text = "\(student.score)"
        birthDate.text = student.birthDate
        address.text = student.address
        email.text = student.email
        phone.text = student.phone
    }
    
    func collectData(){
        student.firstName = firstName.text
        student.lastName = lastName.text
        student.score = (score.text as NSString).doubleValue
        student.birthDate = birthDate.text
        student.address = address.text
        student.email = email.text
        student.phone = phone.text
    }
    
    func validateInput(view: UIView) -> Bool {
        for subView in view.subviews{
            if subView.isKindOfClass(UIScrollView){
                return self.validateInput(subView as UIView)
            }
            if subView.isKindOfClass(CustomTextField){
                if !(subView as CustomTextField).validate(){
                    return false
                }
            }
        }
        return true
    }
    
}

enum EditMode: Int{
    case AddNew, Edit
}

enum SortState: Int{
    case Asc, Desc
}
