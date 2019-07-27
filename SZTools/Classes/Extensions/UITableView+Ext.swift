//
//  UITableView+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/7/10.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit


public extension UITableView {
    
    
    /// 从 nib 注册一个cell
    func zs_registerCellNib(_ nibName: String, cellId: String) {
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    /// 从 nib 注册一个cell，ReuseIdentifier 同类名相同
    func zs_registerCellNib(_ cellClass: AnyClass) {
        let clsName = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(UINib(nibName: clsName, bundle: nil), forCellReuseIdentifier: clsName)
    }
    
    /// 注册一个cell，ReuseIdentifier 同类名相同
    func zs_registerCellClass(_ cellClass: AnyClass) {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(cellClass, forCellReuseIdentifier: cid)
    }
    
    
    /// 获取一个 cell
    func zs_dequeueCell(_ cellId: String) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: cellId)
    }
    
    /// 获取一个 cell
    func zs_dequeueCell(_ cellId: String, _ indexPath: IndexPath) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    }
    
    /// 获取一个 cell
    func zs_dequeueCell(_ cellClass: AnyClass) -> UITableViewCell? {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        return dequeueReusableCell(withIdentifier: cid)
    }
    /// 获取一个 cell
    func zs_dequeueCell(_ cellClass: AnyClass, _ indexPath: IndexPath) -> UITableViewCell? {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        return dequeueReusableCell(withIdentifier: cid, for: indexPath)
    }
    
}
