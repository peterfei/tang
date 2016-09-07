//
//  YMNavigationController.swift
//  DanTang
//
//  Created by peterfei on 16/9/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import SVProgressHUD

class YMNavigationController: UINavigationController {

    
    internal override class func initialize(){
    
        super.initialize()
        
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"),style: .Plain, target: self, action:#selector(navigationBackClick))

        }
        super.pushViewController(viewController, animated: true)

    }
    
    
    func navigationBackClick(){
    
        if  SVProgressHUD.isVisible()  {
            SVProgressHUD.dismiss()
        }
        if UIApplication.sharedApplication().networkActivityIndicatorVisible {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        popViewControllerAnimated(true)

    }
 

}
