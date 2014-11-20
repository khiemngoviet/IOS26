//
//  DemoNSTimer.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/26/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class EarthAroundSun: UIViewController {
    //bước 1: phải khai báo biến instant variable (property) kiểu NSTimer
    var timer: NSTimer?
    
    //bước 2: khai báo các biến liên quan đến gốc toạ độ của tâm mặt trời
    var x0: Double = 0.0  //Toạ độ mặt trời
    var y0: Double = 0.0
    
    var radius: Double = 0.0 //đường kính ~ khoảng cách tâm mặt trời và trái đất
    var angle: Double = 0.0 //biến mô tả góc quay
    var earth: UIImageView?
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.blackColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        //bước 3: cài đặt các giá trị ban đầu hoặc giá trị mặc định của các biến
        
        let sun = UIImageView(image: UIImage(named: "sun.png"))
        let boundSize = self.view.bounds.size
        x0 = Double(boundSize.width) * 0.5
        y0 = Double(boundSize.height - 60) * 0.5
        radius = Double(x0) - 20.0
        sun.center = CGPoint(x: x0, y: y0)
        sun.bounds = CGRect(x: 0, y: 0, width: 48, height: 48)
        self.view.addSubview(sun)  //thêm view mặt trời
  
        earth = UIImageView(image: UIImage(named: "earth.png"))
        earth?.center = computePos(angle)
        self.view.addSubview(earth!)  //thêm view trái đất
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
       /* timer = NSTimer(timeInterval: 0.1, target: self, selector: Selector("timingFunction:"), userInfo: ["data": "OX-13"], repeats: true)*/
        //bước 4: Tạo ra timer, định ra hàm sẽ run là gì?
        timer = NSTimer.scheduledTimerWithTimeInterval(0.0167, target: self, selector: "timingFunction:", userInfo: ["data": "OX-13"], repeats: true)
        
        //bước 5: khởi động timer
        timer?.fire()
    }
    
    func timingFunction(timer: NSTimer) {
        /*if let userInfo : AnyObject = timer.userInfo? {
            if let message: AnyObject? = userInfo["data"] {
                println("test \(message!)")
            }
        }*/
        earth?.center = computePos(angle)
        angle += 0.01
        
    }
    //Tính toạ độ của trái đất theo góc truyền vào
    func computePos(alpha: Double) -> CGPoint {
      //  println("\(alpha)")
        return CGPoint (x: Double(x0) + radius * cos(alpha),
            y: Double(y0) + radius * sin(alpha))
 
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
   
}
