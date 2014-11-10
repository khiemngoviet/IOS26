//Trong ví dụ này hãy quan sát thứ tự các event của ViewController
//Ngoài ra quan sát Instruments > Memory Allocation bằng lệnh Product > Analyze
import UIKit

class DemoViewControllerEvents: UIViewController {
    var imageArray: [NSData]?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        println("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        println("view did appear")
     /*   imageArray = [NSData]()
        for (var i = 0; i < 2; i++) {
            imageArray!.append(UIImageJPEGRepresentation(UIImage(named: "Belgian_Malinois.jpg"), 1.0))
        }*/

    }
    
    override func viewWillDisappear(animated: Bool) {
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("view did disappear")
    }
    
    override func viewWillLayoutSubviews() {
        println("view will layout subview")
    }
    
    override func viewDidLayoutSubviews() {
        println("view did layout subview")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("Memory Warning !")
        
    }
    

}
