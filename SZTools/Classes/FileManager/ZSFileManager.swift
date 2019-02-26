//
//  ZSFileManager.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/26.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import UIKit

public class ZSFileManager: NSObject {
    
    public class func isDir(_ dirPath: String) -> Bool {
        var isDirectory: ObjCBool = true
        if FileManager.default.fileExists(atPath: dirPath, isDirectory: &isDirectory) {
            return true
        }
        return false
    }
    
    
    /// 删除一组文件
    public class func deleteFiles(atPaths: [String]?) {
        guard let paths = atPaths else {
            return
        }
        
        let fileMan = FileManager.default
        for p in paths {
            if fileMan.fileExists(atPath: p) {
                try? fileMan.removeItem(atPath: p)
            }
        }
    }
    
    /// 删除一组文件
    public class func deleteFiles(files: [ZSFile]?) {
        guard let models = files else {
            return
        }
        
        let fileMan = FileManager.default
        for m in models {
            guard let path = m.path else {
                continue
            }
            if fileMan.fileExists(atPath: path) {
                try? fileMan.removeItem(atPath: path)
            }
        }
    }
    
    /// 重命名文件
    public class func rename(file: ZSFile, newName: String) {
        guard let path = file.path else {
            return
        }
        let fileMan = FileManager.default
        let pathStr = path as NSString
        
        let destPath = pathStr.deletingLastPathComponent + newName + pathStr.pathExtension
        
        if fileMan.fileExists(atPath: path) {
            try? fileMan.moveItem(atPath: path, toPath: destPath)
        }
    }
    
}
