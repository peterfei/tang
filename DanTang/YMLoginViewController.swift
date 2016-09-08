//
//  YMLoginViewController.swift
//  DanTang
//
//  Created by peterfei on 16/9/8.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMLoginViewController: YMBaseViewController {

//    手机号
    @IBOutlet weak var mobileField: UITextField!
//    password
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var forgetPwdBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏的左右按钮
        setupBarButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(cancelButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(regiisterButtonClick))
    }
    
    /// 取消按钮点击
    func cancelButtonClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /// 注册按钮点击
    func regiisterButtonClick() {
//        let registerVC = YMRegisterViewController()
//        registerVC.title = "注册"
//        navigationController?.pushViewController(registerVC, animated: true)
    }


}
