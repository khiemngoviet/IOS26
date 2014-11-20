//
//  StarField.swift
//  UIViewControls
//
//  Created by Trinh Minh Cuong on 9/29/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//  Converted to Swift by Le Dinh Duy

import UIKit

class StarField: UIViewController {
    var red, violet, brown, green: UIImageView?
    var center: CGPoint!
    let deltaX = CGFloat(100)
    let deltaY = CGFloat(100)
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width * 0.5, (size.height - 60) * 0.5)
        red = UIImageView(image: UIImage(named: "red.png"))
        violet = UIImageView(image: UIImage(named: "violet.png"))
        brown = UIImageView(image: UIImage(named: "brown.png"))
        green = UIImageView(image: UIImage(named: "green.png"))
        
        self.vitri()

        self.view.addSubview(red!)
        self.view.addSubview(violet!)
        self.view.addSubview(brown!)
        self.view.addSubview(green!)
        
        Animate()
    }
    func Animate() {
        UIView.animateWithDuration(1, animations: {
            self.brown!.center = CGPointMake(self.center.x - 100, self.center.y - 100)
            self.red!.center = CGPointMake(self.center.x + self.deltaX, self.center.y + self.deltaY)
            self.green!.center = CGPointMake(self.center.x + self.deltaX, self.center.y - self.deltaY)
            self.violet!.center = CGPointMake(self.center.x - self.deltaX, self.center.y + self.deltaY)
            }, completion: { (finished: Bool) in
                UIView.animateWithDuration(1, animations: {
                    self.brown!.center = CGPointMake(self.center.x - self.deltaX, self.center.y)
                    self.green!.center = CGPointMake(self.center.x, self.center.y - self.deltaY)
                    self.red!.center = CGPointMake(self.center.x + self.deltaX, self.center!.y)
                    self.violet!.center = CGPointMake(self.center.x, self.center.y + self.deltaY)
                    }, completion: { (finished: Bool) in
                        UIView.animateWithDuration(3, animations: {
                            self.vitri()
                            }, completion: { (finished: Bool) in
                                self.Animate()
                                
                        })
                })
        })
    }
    func vitri() {
        red!.center = center
        violet!.center = center
        brown!.center = center
        green!.center = center
    }
    


}
