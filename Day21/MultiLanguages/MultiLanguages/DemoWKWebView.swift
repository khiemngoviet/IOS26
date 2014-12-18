//
//  DemoWKWebView.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/12/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import WebKit
class DemoWKWebView: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    var wkWebView: WKWebView?
    var toolBar: UIToolbar?
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.blackColor()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.addScriptMessageHandler(self,
            name: "interOp")
        wkWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: configuration)
        wkWebView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        wkWebView?.UIDelegate = self
        wkWebView?.navigationDelegate = self

    
        view.addSubview(wkWebView!)
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        toolBar?.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(toolBar!)
        
        let views = ["view": view, "wkWebView": wkWebView!, "toolBar": toolBar!]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[wkWebView]|", options: nil, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[toolBar]|", options: nil, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[wkWebView]-[toolBar(44)]|", options: nil, metrics: nil, views: views))
        
        let callJavaScriptButton = UIBarButtonItem(title: "JavaScript", style: UIBarButtonItemStyle.Plain, target: self, action: "callJavaScript")
        let navigateButton = UIBarButtonItem(title: "Navigate", style: UIBarButtonItemStyle.Plain, target: self, action: "navigate")
        let openHTMLButton = UIBarButtonItem(title: "Local HTML", style: UIBarButtonItemStyle.Plain, target: self, action: "openLocalHTML")
        toolBar?.items = [callJavaScriptButton, navigateButton, openHTMLButton]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Interact with WKWebView
    //Tap on callJavaScript only 
    func callJavaScript() {
        wkWebView?.evaluateJavaScript("changeSomething();", completionHandler: { (_, _) -> Void in
            println("Done")
        })
    }
    
    func navigate() {
        wkWebView?.loadRequest(NSURLRequest(URL: NSURL(string: "http://techmaster.vn")!))
    }
    
    func openLocalHTML() {
        if let fileName = NSBundle.mainBundle().pathForResource("index", ofType: "html") {
            if let htmlString = String(contentsOfFile: fileName, encoding: NSUTF8StringEncoding, error: nil) {
                let path = fileName.stringByDeletingLastPathComponent
                wkWebView?.loadHTMLString(htmlString, baseURL: NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath))
            }
        }
    }
    
    //MARK: -
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        println("\(message.name) - \(message.body)")
        
    }


}
