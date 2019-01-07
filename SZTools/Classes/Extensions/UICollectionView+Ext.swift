//
//  UICollectionView+Ext.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/12/14.
//  Copyright © 2018年 NoOrg. All rights reserved.
//


import Foundation
import UIKit


extension UICollectionView {
    
    
    /// 从 nib 注册一个cell
    func registerCellNib(_ nibName: String, cellId: String) {
        register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    /// 从 nib 注册一个cell，ReuseIdentifier 同类名相同
    func registerCellNib(_ cellClass: AnyClass) {
        let clsName = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(UINib(nibName: clsName, bundle: nil), forCellWithReuseIdentifier: clsName)
    }
    
    /// 注册一个cell，ReuseIdentifier 同类名相同
    func registerCellClass(_ cellClass: AnyClass) {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        register(cellClass, forCellWithReuseIdentifier: cid)
    }
    
    
    /// 获取一个 cell
    func dequeueCell(_ cellId: String, indexPath: IndexPath) -> UICollectionViewCell? {
        return dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    /// 获取一个 cell
    func dequeueCell(_ cellClass: AnyClass, indexPath: IndexPath) -> UICollectionViewCell? {
        let cid = NSStringFromClass(cellClass).components(separatedBy: ".").last!
        return dequeueReusableCell(withReuseIdentifier: cid, for: indexPath)
    }
    
}
