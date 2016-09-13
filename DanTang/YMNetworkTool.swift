//
//  YMNetworkTool.swift
//  DanTang
//
//  Created by peterfei on 16/9/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class YMNetworkTool: NSObject {
    /// 单例
    static let shareNetworkTool = YMNetworkTool()
    
    /// 获取首页数据
    func loadHomeInfo(id: Int, finished:(homeItems: [YMHomeItem]) -> ()) {
//        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/channels/" + String(id) + "/items?gender=1&generation=1&limit=20&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
//                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
                    // 移除加载提示
//                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject {
                        var homeItems = [YMHomeItem]()
                        for item in items {
                            let homeItem = YMHomeItem(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems: homeItems)
                    }
                }
        }
    }
    
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:(ym_channels: [YMChannel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset?gender=1&generation=1"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
//                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
//                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let channels = data!["channels"]?.arrayObject {
                        var ym_channels = [YMChannel]()
                        for channel in channels {
                            let ym_channel = YMChannel(dict: channel as! [String: AnyObject])
                            ym_channels.append(ym_channel)
                        }
                        finished(ym_channels: ym_channels)
                    }
                }
        }
        
    }
    
    /// 搜索界面数据
    func loadHotWords(finished:(words: [String]) -> ()) {
//        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v1/search/hot_words?"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
//                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
//                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let hot_words = data["hot_words"]?.arrayObject {
                            finished(words: hot_words as! [String])
                        }
                    }
                }
        }
    }
    
    
    /// 获取单品数据
    func loadProductData(finished:(products: [YMProduct]) -> ()) {
//        SVProgressHUD.showWithStatus("正在加载...")
        let url = BASE_URL + "v2/items?gender=1&generation=1&limit=20&offset=0"
        Alamofire
            .request(.GET, url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
//                    SVProgressHUD.showErrorWithStatus("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
//                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let items = data["items"]?.arrayObject {
                            var products = [YMProduct]()
                            for item in items {
                                if let itemData = item["data"] {
                                    let product = YMProduct(dict: itemData as! [String: AnyObject])
                                    products.append(product)
                                }
                            }
                            finished(products: products)
                        }
                    }
                }
        }
    }
    /// 根据搜索条件进行搜索
    func loadSearchResult(keyword: String, sort: String, finished:(results: [YMSearchResult]) -> ()) {
//        SVProgressHUD.showWithStatus("正在加载...")
        let url = "http://api.dantangapp.com/v1/search/item"
        let params = ["keyword": "%E6%88%92%E6%8C%87",
                      "limit": 20,
                      "offset": 0,
                      "sort": ""]

        Alamofire
            .request(.GET, url, parameters: params)
            .responseJSON { (response) in
                
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
//                    _ = dict["message"].stringValue
                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
                        return
                    }
//                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    
                    if let items = data!["items"]?.arrayObject {
                        var results = [YMSearchResult]()
                        for item in items {
                            let result = YMSearchResult(dict: item as! [String: AnyObject])
                            results.append(result)

//                            finished(words: hot_words as! [String])
                            
                        }
                        finished(results: results)

                    }
                }
        }
    }

    
}
