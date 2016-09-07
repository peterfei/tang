

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class YMBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.fd_prefersNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
//        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
//        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
//        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
//        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
    }
    
  
    
}
