//
//  YMTopicViewController.swift
//  DanTang
//
//  Created by peterfei on 16/9/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
let homeCellID = "homeCellID"

class YMTopicViewController: YMBaseViewController, UITableViewDelegate, UITableViewDataSource, YMHomeCellDelegate {
    var type = Int()
    
    var tableView = UITableView()
    /// 首页列表数据
    var items = [YMHomeItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = YMGlobalColor()
        setupTableView()
        // 获取首页数据
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf?.tableView.reloadData()

        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeCellID) as! YMHomeCell
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = YMDetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        print("favorite button click")
        let loginVC = YMLoginViewController()
        loginVC.title = "登录"
        let nav = YMNavigationController(rootViewController: loginVC)
        presentViewController(nav, animated: true, completion: nil)
    }
    
    func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(YMHomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeCellID)
        view.addSubview(tableView)
        self.tableView = tableView
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
