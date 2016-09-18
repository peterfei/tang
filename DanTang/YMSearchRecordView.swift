//
//  YMSearchRecordView.swift
//  DanTang
//
//  Created by peterfei on 16/9/18.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMSearchRecordView: UIView {
    /// 关键词
    var words = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 搜索界面数据获取热搜关键词
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadHotWords { (hot_words) in
            weakSelf!.words = hot_words
            weakSelf!.setupUI()
        }
    }
    
    func setupUI() {
        
        // 大家都在搜
        let topView = UIView()
        addSubview(topView)
        let hotLabel = setupLabel("大家都在搜")
        hotLabel.frame = CGRectMake(10, 20, 200, 20)
        topView.addSubview(hotLabel)
        
        
        // 历史纪录
        let bottomView = UIView()
        
        addSubview(bottomView)
    }
    
    
    
    func setupLabel(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = YMColor(0, g: 0, b: 0, a: 0.6)
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}