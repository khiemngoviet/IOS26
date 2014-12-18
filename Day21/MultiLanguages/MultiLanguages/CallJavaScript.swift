//
//  CallJavaScript.swift
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
import JavaScriptCore

class CallJavaScript: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = NSBundle.mainBundle().pathForResource("factorial", ofType: "js") {
            if let factorialScript = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil) {
                let context = JSContext()
                context.evaluateScript(factorialScript)
                let function = context.objectForKeyedSubscript("factorial") as JSValue!
                let result = function.callWithArguments([15])
                self.writeln("result = \(result)")
            }
            
        }
        
    }

}
