//
//  NSObject+Ext.swift
//  iReader
//
//  Created by Will on 2018/12/1.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation

extension NSObject {
    
    // 类方法，获取类名
    public class func zs_className() -> String {
        
        let components = description().components(separatedBy: ".")
        if components.count > 1 {
            return components.last!
        }
        return components.first!
    }

    // 实例方法，获取类名
    public var zs_className: String {
        get {
            return String(describing: type(of: self))
        }
    }
    
    
    /*
     //1:获取当前类的应用名称+类名
     print(AppDelegate.description())
     //2:获取当前类的应用名称+类名
     print(AppDelegate.classForCoder().description())
     //3:获取当前类的应用名称+类名
     print(String(AppDelegate.description()))
     //4:类名=>类
     print(type(of:AppDelegate()))
     //5:类名=>String
     print(String(describing: type(of:AppDelegate())))
     //6.类名=>截取字符串
     print(NSStringFromClass(type(of:AppDelegate())).components(separatedBy: ".").last!)
     //7.类名
     print(String(describing: self.classForCoder))
     */
}
