//
//  NotificationCenter+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/12.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation


extension NotificationCenter {
    
    
    public class func post(_ name: String, object: Any? = nil, info: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(name), object: object, userInfo: info)
    }
    
    public class func listen(_ observer: Any, sel: Selector, name: String) {
        NotificationCenter.default.addObserver(observer, selector: sel, name: NSNotification.Name(name), object: nil)
    }
    
    public class func removeAll(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    public class func remove(_ observer: Any, _ name: String) {
        NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(name), object: nil)
    }
    
}
