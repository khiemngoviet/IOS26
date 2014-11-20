//
//  AddUpdateStudentVC.swift
//  DemoTable
//
//  Created by cuong minh on 11/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class AddUpdateStudentVC: UIViewController, UITextFieldDelegate {

    private var txtfullName: UITextField!
    private var sliderScore: UISlider!
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.whiteColor()
        self.title = "Add/Update Student"
        self.edgesForExtendedLayout = UIRectEdge.allZeros
        txtfullName = UITextField()
        txtfullName.setTranslatesAutoresizingMaskIntoConstraints(false)
        txtfullName.delegate = self
        txtfullName.placeholder = "Please enter full name of student"
        txtfullName.borderStyle = UITextBorderStyle.Line
        let requiredImage = UIImage(named: "required.png")
        let rightView = UIImageView(image: requiredImage)
        rightView.bounds = CGRectInset(CGRect(origin: CGPoint.zeroPoint, size: requiredImage!.size), -3, -3)
        rightView.contentMode = UIViewContentMode.Left
        txtfullName.rightView = rightView
        
        txtfullName.rightViewMode = UITextFieldViewMode.Always
        view.addSubview(txtfullName)
        
        sliderScore = UISlider()
        sliderScore.minimumValue = 0
        sliderScore.maximumValue = 10
        sliderScore.value = 0
        sliderScore.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(sliderScore)
        
        let views = ["view": view, "txfullName": txtfullName, "sliderScore": sliderScore]
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[txfullName(30)]-40-[sliderScore(30)]-(>=20)-|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[txfullName]-20-|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[sliderScore]-20-|", options: nil, metrics: nil, views: views))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "save")!, target: self, action: "onSave")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        txtfullName.text = ""
        sliderScore.value = 0.0
    }
  
    func onSave() {
        DataManager.singleton.students.addObject(Student(name: txtfullName.text , score: Double(sliderScore.value)))
        
        for item in DataManager.singleton.students {
            println( (item as Student).fullName)
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
