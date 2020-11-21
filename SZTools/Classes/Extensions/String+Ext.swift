//
//  NSString+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/9/6.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    
    ///根据字体和范围size计算字符串的 size
    func zs_size(_ font: UIFont, inSize: CGSize) -> CGSize {
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        
        let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: style]
        let nsstr =  self as NSString
        return nsstr.boundingRect(with: inSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
    }
    
    /// 截取字符串
    func zs_subString(withRange range: NSRange?) -> String? {
        guard let r = range else {
            return nil
        }
        
        let start = String.Index(utf16Offset: 0, in: self)
        
        let f = index(start, offsetBy: r.location)
        let e = index(start, offsetBy: r.location + r.length)
        let sub = self[f..<e]
        
        return String(sub)
    }
    
    
    //MARK: - 本地化
    func zs_Localized() -> String {
        // 多语言本地化，下面两种方法都可以，默认的 tableName 是 Localizable，首字母要大写。comment 是一个注释，这里不需要
        return NSLocalizedString(self, comment: "")
        //return NSLocalizedString(key, tableName: "Localizable", comment: "")
    }
    
    
}






