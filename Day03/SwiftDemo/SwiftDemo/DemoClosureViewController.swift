//
//  DemoClosureViewController.swift
//  SwiftDemo
//
//  Created by ios26 on 9/29/14.
//  Copyright (c) 2014 Techmaster Vietnam. All rights reserved.
//

import UIKit

class DemoClosureViewController: ConsoleScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

        let a = imageProcess(ImageType.PSD)
       self.writeln(a!(name: "test"))
    }
    
    

    func imageProcess(imageType: ImageType) -> ((name: String) -> String)? {
        switch imageType {
        case .JPG:
            func ProcessPNG(name: String) ->String{
                return ImageType.JPG.toRaw()
            }
            return ProcessPNG
        case .PNG:
            func ProcessPNG(name: String)->String{
                return ImageType.PNG.toRaw()
            }
            return ProcessPNG
        case .PSD:
            func ProcessPSD(name: String)-> String{
                return ImageType.PSD.toRaw()
            }
            return ProcessPSD
        default:
            return nil
        }
    }

}

enum ImageType: String{
    case PNG = "PNG"
    case JPG = "JPG"
    case PSD = "PSD"
}