//
//  UIViewController+Jump.swift
//  ZSFileBrowser
//
//  Created by Will on 2019/3/22.
//  Copyright © 2019年 NoOrg. All rights reserved.
//

import UIKit
import Foundation


public extension UIViewController {
    
    /// 导航 push 到一个 ViewController
    func zs_pushTo(_ vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// 导航 pop 到上一个 ViewController
    func zs_pop(_ animated: Bool = true) -> UIViewController? {
        return self.navigationController?.popViewController(animated: animated)
    }
    
    /// 导航 pop 到根 ViewController
    func zs_popToRoot(_ animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToRootViewController(animated: animated)
    }
    
    /// 导航 pop 到指定的 vc
    func zs_popTo(_ vc: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToViewController(vc, animated: animated)
    }
    
    /// 导航 pop 指定数量的层级。比如有 A,B,C 3个VC，当 length == 2 时，将返回到 A
    func zs_popStack(_ length: Int, animated: Bool = true) {
        if length == 1 {
            _ = self.zs_pop()
            return
        }
        let arr = self.navigationController?.viewControllers
        guard let vcs = arr else {
            return
        }
        if length >= vcs.count {
            return
        }
        let level = vcs.count - length
        if level == 1{
            _ = self.zs_popToRoot()
            return
        }
        var tempVCs = [UIViewController]()
        for i in 0 ..< level {
            tempVCs.append(vcs[i])
        }
        self.navigationController?.setViewControllers(tempVCs, animated: animated)
    }
    
    
}
