//
//  DispathcQueue+Delay.swift
//  iReader
//
//  Created by WillZh on 2018/9/4.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation

typealias Task = (_ cancle : Bool) -> Void


extension DispatchQueue {
    
    
    /// 延迟执行，返回一个 Task，可以取消延迟任务
    @discardableResult
    func delay(_ time: TimeInterval, task: @escaping() -> ()) -> Task? {
        
        func dispatch_later(block: @escaping() -> ()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        
        var closure : (() -> Void)? = task
        var result : Task?
        
        let delayedClosure : Task = { cancle in
            if let internalClosure = closure {
                if cancle == false {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        
        return result
    }
    
    /// 取消延迟任务
    func cancle(_ task: Task?) {
        task?(true)
    }
    
}
