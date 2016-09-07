//
//  YMChannel.swift
//  DanTang
//
//  Created by peterfei on 16/9/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMChannel: NSObject {
    var editable: Bool?
    var id: Int?
    var name: String?

    init(dict:[String: AnyObject]){
    
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
        
    }
}
