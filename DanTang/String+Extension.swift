//
//  String+Extension.swift
//  DanTang
//
//  Created by peterfei on 16/9/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import Foundation
public extension String {
    
    /// 判断手机号是否合法
    static func isValidmobile(string: String) -> Bool {
        // 判断是否是手机号
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluateWithObject(string)
    }
    
    /// 判断密码是否合法
    static func isValidPasswod(string: String) -> Bool {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluateWithObject(string)
    }
    
    /// 格式化金额
    static func stringWithFormatMoney(money: Double) -> String {
        var moneyStr: String
        
        if money < 10000 {
            moneyStr = String(format: "%.2f", money)
        } else {
            let newMoney = money / 10000.0
            moneyStr = String(format: "%.2f万", newMoney)
        }
        return moneyStr
    }
    
}
