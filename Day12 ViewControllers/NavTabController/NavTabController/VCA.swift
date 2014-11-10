//
//  VCA.swift
//  NavTabController
//
//  Created by cuong minh on 10/31/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class VCA: UIViewController {

    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UK"
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        button.setTitle("Close", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "uk.png"))
        web.loadRequest(NSURLRequest(URL: NSURL(string: "http://en.wikipedia.org/wiki/United_Kingdom")!))
    }


}
