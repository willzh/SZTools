//
//  Date+Formatted.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/26.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation

public extension Date {
    
    /// 简单格式化时间，返回距离当前时间的间隔，比如 1h, 1m, 1M 等
    func zs_simpleFormatted() -> String {
        let t = Date().timeIntervalSince(self)
        
        let m = t / 60;
        let h = m / 60;
        let d = h / 24;
        let M = d / 30;
        let y = M / 12;
        
        if (y > 0) {
            return String(format: "%dy", y)
        }else if (M > 0) {
            return String(format: "%dM", M)
        }else if (d > 0) {
            return String(format: "%dd", d)
        }else if (h > 0) {
            return String(format: "%dh", h)
        }else if (m > 0) {
            return String(format: "%dm", m)
        }else {
            return "0m";
        }
    }
    
    func zs_format(_ format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }

    
}
