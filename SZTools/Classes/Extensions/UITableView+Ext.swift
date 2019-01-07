//
//  UITableView+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/10.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    
    
    /// 从 nib 注册一个cell
    public func registerCellNib(_ nibName: String, cellId: String) {
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    /// 从 nib 注册一个cell，ReuseIdentifier 同类名相同
    public func registerCellNib(_ cellClass: AnyClass) {
        let clsName = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(UINib(nibName: clsName, bundle: nil), forCellReuseIdentifier: clsName)
    }
    
    /// 注册一个cell，ReuseIdentifier 同类名相同
    public func registerCellClass(_ cellClass: AnyClass) {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(cellClass, forCellReuseIdentifier: cid)
    }
    
    
    /// 获取一个 cell
    public func dequeueCell(_ cellId: String) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: cellId)
    }
    
    /// 获取一个 cell
    public func dequeueCell(_ cellId: String, _ indexPath: IndexPath) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    }
    
    /// 获取一个 cell
    public func dequeueCell(_ cellClass: AnyClass) -> UITableViewCell? {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        return dequeueReusableCell(withIdentifier: cid)
    }
    /// 获取一个 cell
    public func dequeueCell(_ cellClass: AnyClass, _ indexPath: IndexPath) -> UITableViewCell? {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        return dequeueReusableCell(withIdentifier: cid, for: indexPath)
    }
    
}
