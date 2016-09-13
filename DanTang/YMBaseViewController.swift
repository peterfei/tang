

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class YMBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YMGlobalColor()
        navigationController?.fd_prefersNavigationBarHidden = true
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
