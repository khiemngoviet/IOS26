//
//  NewsPaperLayout.swift
//  DemoAdaptiveLayout
//
//  Created by Khiem Ngo Viet on 11/7/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class NewsPaperLayout: UIViewController {
    
    var thum1: UIImageView!
    var title1: UITextView!
    var content1: UITextView!
    var thum2: UIImageView!
    var title2: UITextView!
    var content2: UITextView!
    
    var container1, container2: UIView!
    
    var c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11: [AnyObject]!
    var col1, col2: NSLayoutConstraint!
    var c_1, c_2, c_3: [AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        container1 = UIView()
        container1.backgroundColor = UIColor.lightGrayColor()
        container1.setTranslatesAutoresizingMaskIntoConstraints(false)
        container2 = UIView()
        container2.setTranslatesAutoresizingMaskIntoConstraints(false)
        container1.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(container1)
        self.view.addSubview(container2)
        
        
        thum1 = UIImageView(image: UIImage(named: "Boua.jpg"))
        title1 = UITextView()
        title1.scrollEnabled = false
        title1.editable = false
        title1.backgroundColor = UIColor.clearColor()
        title1.textAlignment = NSTextAlignment.Justified
        title1.font = UIFont.boldSystemFontOfSize(12)
        title1.text = "Loạt trận thứ 4 Champions League diễn ra với khá nhiều bất ngờ thú vị. Hãy cùng điểm qua 11 cầu thủ xuất sắc nhất trong hai ngày thi đấu vừa qua."
        content1 = UITextView()
        content1.scrollEnabled = false
        content1.editable = false
        content1.textAlignment = NSTextAlignment.Justified
        content1.backgroundColor = UIColor.clearColor()
        content1.text = "Anthony vanden Borre (Anderlecht): Mặc dù là hậu vệ phải nhưng vanden Borre đã đóng góp 2 bàn thắng, giúp cho Anderlecht tạo nên màn lội ngược dòng không tưởng trước Arsenal.\nAnthony vanden Borre (Anderlecht): Mặc dù là hậu vệ phải nhưng vanden Borre đã đóng góp 2 bàn thắng, giúp cho Anderlecht tạo nên màn lội ngược dòng không tưởng trước Arsenal.Anthony vanden\n Anthony vanden Borre (Anderlecht): Mặc dù là hậu vệ phải nhưng vanden Borre đã đóng góp 2 bàn thắng, giúp cho Anderlecht tạo nên màn lội ngược dòng không tưởng trước Arsenal."
        title1.setTranslatesAutoresizingMaskIntoConstraints(false)
        thum1.setTranslatesAutoresizingMaskIntoConstraints(false)
        content1.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        container1.addSubview(title1)
        container1.addSubview(thum1)
        container1.addSubview(content1)
        
        
        thum2 = UIImageView(image: UIImage(named: "Suarez.jpg"))
        title2 = UITextView()
        title2.editable = false
        title2.scrollEnabled = false
        title2.textAlignment = NSTextAlignment.Justified
        title2.font = UIFont.boldSystemFontOfSize(12)
        title2.text = "Bất chấp màn trình diễn chói sáng trong mùa giải vừa qua nhưng Luis Suarez vẫn bị gạt khỏi danh sách đề cử danh hiệu Quả bóng vàng 2014"
        content2 = UITextView()
        content2.editable = false
        content2.scrollEnabled = false
        content2.textAlignment = NSTextAlignment.Justified
        content2.text = "Trong mùa giải 2013/14, Luis Suarez đã trình diễn phong độ vô cùng xuất sắc với 31 bàn thắng ở Premier League, góp công lớn giúp Liverpool trở lại Champions League sau 5 năm chờ đợi.\nNgoài danh hiệu Vua phá lưới Premier League, chân sút người Uruguay cũng giành cả Chiếc giày vàng châu Âu (chia sẻ cùng C.Ronaldo). Với thành tích đó, đương nhiên, tiền đạo này chắc suất ở đề cử Quả bóng vàng.\nMặc dù vậy, trong bản danh sách mà FIFA công bố ngày hôm qua không có tên của Luis Suarez. Vậy nguyên nhân từ đâu? Trên thực tế, FIFA đã không sai khi loại bỏ cựu cầu thủ của Liverpool."
        title2.setTranslatesAutoresizingMaskIntoConstraints(false)
        thum2.setTranslatesAutoresizingMaskIntoConstraints(false)
        content2.setTranslatesAutoresizingMaskIntoConstraints(false)
        container2.addSubview(title2)
        container2.addSubview(thum2)
        container2.addSubview(content2)
        
        self.portraitConstraint()
        self.landscapeConstraint()
    }
    
    func portraitConstraint(){
        let views = ["view": self.view, "container1": self.container1, "container2": self.container2]
        c1 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5.0-[container1]-5.0-[container2]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c1)
        c2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-5.0-[container1]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c2)
        c3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-5.0-[container2]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c3)
        col1 = NSLayoutConstraint(item: self.container1, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.container2, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        self.view.addConstraint(col1)
        col2 = NSLayoutConstraint(item: self.container1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.container2, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(col2)
        
        
        let container1s = ["container1": self.container1, "thum1": self.thum1, "title1": self.title1, "content1": self.content1]
        c4 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0.0-[thum1(60)]-0.0-[content1]-0.0-|", options: nil, metrics: nil, views: container1s)
        self.view.addConstraints(c4)
        c5 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0.0-[title1(60)]-0.0-[content1]-0.0-|", options: nil, metrics: nil, views: container1s)
        self.view.addConstraints(c5)
        c6 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[thum1(60)]-0.0-[title1]-0.0-|", options: nil, metrics: nil, views: container1s)
        self.view.addConstraints(c6)
        c7 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[content1]-0.0-|", options: nil, metrics: nil, views: container1s)
        self.view.addConstraints(c7)
        
        
        let container2s = ["container2": self.container2, "thum2": self.thum2, "title2": self.title2, "content2": self.content2]
        c8 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0.0-[thum2(60)]-0.0-[content2]-0.0-|", options: nil, metrics: nil, views: container2s)
        self.view.addConstraints(c8)
        c9 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0.0-[title2(60)]-0.0-[content2]-0.0-|", options: nil, metrics: nil, views: container2s)
        self.view.addConstraints(c9)
        c10 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[thum2(60)]-0.0-[title2]-0.0-|", options: nil, metrics: nil, views: container2s)
        self.view.addConstraints(c10)
        c11 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0.0-[content2]-0.0-|", options: nil, metrics: nil, views: container2s)
        self.view.addConstraints(c11)
        
    }
    
    func toggleConstraint(portrait: Bool) {
        if portrait {
            //Always deactivate constraint first
            NSLayoutConstraint.deactivateConstraints(c_1!)
            NSLayoutConstraint.deactivateConstraints(c_2!)
            NSLayoutConstraint.deactivateConstraints(c_3!)
            
            //Then activate later
            NSLayoutConstraint.activateConstraints(c1!)
            NSLayoutConstraint.activateConstraints(c2!)
            NSLayoutConstraint.activateConstraints(c3!)
            
        } else {
            NSLayoutConstraint.deactivateConstraints(c1!)
            NSLayoutConstraint.deactivateConstraints(c2!)
            NSLayoutConstraint.deactivateConstraints(c3!)
            
            NSLayoutConstraint.activateConstraints(c_1!)
            NSLayoutConstraint.activateConstraints(c_2!)
            NSLayoutConstraint.activateConstraints(c_3!)
        }
    }
    
    
    func landscapeConstraint(){
        let views = ["view": self.view, "container1": self.container1, "container2": self.container2]
        c_1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-5.0-[container1]-5.0-[container2]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_1)
        c_2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5.0-[container1]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_2)
        c_3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-5.0-[container2]-5.0-|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(c_3)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let size = self.view.bounds.size
        if size.width < size.height { //portrait
            toggleConstraint(true)
        } else {
            toggleConstraint(false)
        }
        
    }
    
    
}
