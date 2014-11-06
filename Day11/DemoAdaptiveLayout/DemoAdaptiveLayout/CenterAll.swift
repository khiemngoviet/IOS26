//Vẽ một hình chữ nhật, kích thước co dãn theo kích thước

import UIKit

class CenterAll: UIViewController {
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        let blueRect = UIImageView(image: UIImage(named: "playboy.jpg"))
        blueRect.contentMode = UIViewContentMode.ScaleAspectFit
        blueRect.backgroundColor = UIColor.blueColor()

        self.view.addSubview(blueRect)
        blueRect.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let views = ["view": self.view, "blueRect": blueRect]

        //Căn giữa trục X - trục hoành
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        //Căn giữa trục Y - trục tung
        self.view.addConstraint(NSLayoutConstraint(item: blueRect, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        //Vertical space: cách top, cách bottom 40 point
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-40.0-[blueRect]-40.0-|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
        
        //Horizontal space: cách left, cách right 40 point
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-40.0-[blueRect]-40.0-|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views))
    }

}
