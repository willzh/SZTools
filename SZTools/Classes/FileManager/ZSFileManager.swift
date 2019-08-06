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
        if FileManager.default.fileExists(atPath: dirPath, isDirectory: &isDirectory) && isDirectory.boolValue {
            return true
        }
        return false
    }
    
    
    /// 删除一组文件
    public class func deleteFiles(_ atPaths: [String]?) {
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
    public class func deleteFiles(_ files: [ZSFile]?) {
        guard let models = files else {
            return
        }
        
        let fileMan = FileManager.default
        for m in models {
            let path = m.path
            if fileMan.fileExists(atPath: path) {
                try? fileMan.removeItem(atPath: path)
            }
        }
    }
    
    /// 重命名文件
    public class func rename(_ file: ZSFile, newName: String) -> Bool {
        let path = file.path
        if !FileManager.default.fileExists(atPath: path) {
            return false
        }
        let pathStr = path as NSString
        let destPath = pathStr.deletingLastPathComponent + newName + pathStr.pathExtension
        
        do {
            try FileManager.default.moveItem(atPath: path, toPath: destPath)
            return true
        } catch {
            return false
        }
    }
    
    /// 创建文件夹
    public class func createFolder(_ path: String) -> Bool {
        do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            return true
        } catch {
            print("create folder error: \(error)")
            return false
        }
    }
    
    /// 创建文件
    public class func createFile(_ path: String) -> Bool {
        return FileManager.default.createFile(atPath: path, contents: nil)
    }
    
    
    /// 拷贝文件
    public class func copyTo(_ path: String, toPath: String) -> Bool {
        do {
            try FileManager.default.copyItem(atPath: path, toPath: toPath)
            return true
        } catch {
            print("copy file error: \(error)")
            return false
        }
    }
    
    /// 拷贝文件
    public class func moveTo(_ path: String, toPath: String) -> Bool {
        do {
            try FileManager.default.moveItem(atPath: path, toPath: toPath)
            return true
        } catch {
            print("move file error: \(error)")
            return false
        }
    }
    
    
    /// 获取可用的路径，主要用于判断同文件夹下是否有同名文件，有则后面加数字
    public class func getValidPath(_ srcPath: String) -> String? {
        
        let fileMan = FileManager.default
        if !fileMan.fileExists(atPath: srcPath) {
            return srcPath
        }
        
        let pstr = srcPath as NSString
        var i = 1
        while i < 99 {
            let ext  = (i == 1) ? " copy" : " copy \(i)"
            let path = pstr.deletingPathExtension + ext + "." + pstr.pathExtension
            if !fileMan.fileExists(atPath: path) {
                return path
            }
            i += 1
        }
        
        return nil
    }
    
    
}
