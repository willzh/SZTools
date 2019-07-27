//
//  UIViewController+Alert.swift
//  iReader
//
//  Created by WillZh on 2018/7/11.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit




public extension UIViewController {
    
    /// 显示一个 UIAlertController
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - msg: 提示内容
    ///   - cancelTitle: 取消键标题，默认为 '取消'
    ///   - buttons: 其他按钮标题
    ///   - handle: 点击按钮回调，可以根据按钮标题名称来判断具体事件
    func zs_showSystemAlert(title: String?, msg: String?, cancelTitle: String? = "取消", buttons: [String], handle: ((_ title: String) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        // 添加取消按钮
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
        
        // 添加自定义按钮
        for bt in buttons {
            let action = UIAlertAction(title: bt, style: .default) { (alertAction) in
                guard let block = handle else {
                    return
                }
                block(bt) // 调用 block 返回
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}








