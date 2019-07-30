//
//  Date+Formatted.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/26.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation

public extension Date {
    
    /// 简单格式化时间，返回距离当前时间的间隔
    func zs_simpleFormatted() -> String {
        let t = Date().timeIntervalSince(self)
        
        if t < 60 {
            return "Now"
        }else if t < Date.zs_secondsOfHour() {
            let t1 = t / 60
            return String(format: "%0.0f minute%@ ago", t1, (t1 < 2.0) ? "" : "s")
        }else if t < Date.zs_secondsOfDay() {
            let t1 = t / Date.zs_secondsOfHour()
            return String(format: "%0.0f hour%@ ago", t1, (t1 < 2.0) ? "" : "s")
        }else if t < Date.zs_secondsOfDay() * 7 {
            let t1 = t / Date.zs_secondsOfDay()
            return String(format: "%0.0f day%@ ago", t1, (t1 < 2.0) ? "" : "s")
        }else {
            return zs_format("yyyy-MM-dd: HH:mm")
        }
    }
    
    // 格式化日期
    func zs_format(_ format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        df.locale = Locale.current
        return df.string(from: self)
    }
    
    
    /// 当前毫秒数
    func zs_currentMilliSeconds() -> TimeInterval {
        return Date().timeIntervalSince1970 * 1000
    }
    
    /// 一天的秒数
    static func zs_secondsOfDay() -> TimeInterval {
        return 86400
    }
    
    /// 一小时的秒数
    static func zs_secondsOfHour() -> TimeInterval {
        return 3600
    }
    
    
}
