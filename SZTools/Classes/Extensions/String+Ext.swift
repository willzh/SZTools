//
//  NSString+Ext.swift
//  iReader
//
//  Created by WillZh on 2018/9/6.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
    ///根据字体和范围size计算字符串的 size
    public func size(_ font: UIFont, inSize: CGSize) -> CGSize {
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        
        let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: style]
        let nsstr =  self as NSString
        return nsstr.boundingRect(with: inSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
    }
    
    /// 截取字符串
    public func subString(withRange range: NSRange?) -> String? {
        if range == nil {
            return nil
        }
        let index3 = index(self.startIndex, offsetBy: range!.location)
        let index4 = index(self.startIndex, offsetBy: range!.location + range!.length)
        let sub = self[index3..<index4]
        
        return String(sub)
    }
}






