//
//  ZSFileSearcher.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/28.
//  Copyright © 2018年 NoOrg. All rights reserved.
//
//
//  文件搜索类

import Foundation



public enum ZSFileSortType: Int {
    case unsort        // 不排序，搜索出来是什么样就是什么样
    case creationDate
    case modifyDate
    case fileName
    case fileSize
}


public class ZSFileSearcher: NSObject {
    
    
    /// 获取文件夹中的文件
    public class func contents(OfDir dirPath: String, sortType: ZSFileSortType = .fileName, ascending: Bool = true, skipHiddenFiles: Bool = true) -> [ZSFile]? {
        if !ZSFileManager.isDir(dirPath) {
            return nil
        }
        
        let fileMan = FileManager.default
        
        var contents: [URL]?
        let opt:FileManager.DirectoryEnumerationOptions = skipHiddenFiles ? .skipsHiddenFiles : .skipsSubdirectoryDescendants
        do {
            contents = try fileMan.contentsOfDirectory(at: URL(fileURLWithPath: dirPath), includingPropertiesForKeys: nil, options: opt)
        }catch {
            print(error)
        }
        
        if contents == nil {
            print("文件夹为空")
            return nil
        }
        
        var fileMods = [ZSFile]()
        for url in contents! {
            fileMods.append(ZSFile(path: url.path))
        }
        
        if sortType == .unsort {
            return fileMods
        }else {
            fileMods = fileMods.sorted { (file1, file2) -> Bool in
                if sortType == .creationDate {
                    return file1.createDate!.compare(file2.createDate!) == (ascending ? .orderedAscending : .orderedDescending)
                }else if sortType == .modifyDate {
                    return file1.modifyDate!.compare(file2.modifyDate!) == (ascending ? .orderedAscending : .orderedDescending)
                }else if sortType == .fileName {
                    return file1.fileName()!.compare(file2.fileName()!) == (ascending ? .orderedDescending : .orderedAscending)
                }else if sortType == .fileSize {
                    return ascending ? file1.fileSize < file2.fileSize : file1.fileSize > file2.fileSize
                }
                return true
            }
        }
        
        return fileMods
    }
    
    /// 获取指定路径下的所有文件夹
    public class func folders(OfDir dirPath: String, sortType: ZSFileSortType = .fileName, ascending: Bool = true, skipHiddenFiles: Bool = true) -> [ZSFile]? {
        if !ZSFileManager.isDir(dirPath) {
            return nil
        }
        
        let fileMan = FileManager.default
        
        var contents: [URL]?
        let opt:FileManager.DirectoryEnumerationOptions = skipHiddenFiles ? .skipsHiddenFiles : .skipsSubdirectoryDescendants
        do {
            contents = try fileMan.contentsOfDirectory(at: URL(fileURLWithPath: dirPath), includingPropertiesForKeys: nil, options: opt)
        }catch {
            print(error)
        }
        
        if contents == nil {
            print("文件夹为空")
            return nil
        }
        
        var fileMods = [ZSFile]()
        for url in contents! {
            let file = ZSFile(path: url.path)
            if file.isDir {
                fileMods.append(file)
            }
        }
        
        if sortType == .unsort {
            return fileMods
        }else {
            fileMods = fileMods.sorted { (file1, file2) -> Bool in
                if sortType == .creationDate {
                    return file1.createDate!.compare(file2.createDate!) == (ascending ? .orderedAscending : .orderedDescending)
                }else if sortType == .modifyDate {
                    return file1.modifyDate!.compare(file2.modifyDate!) == (ascending ? .orderedAscending : .orderedDescending)
                }else if sortType == .fileName {
                    return file1.fileName()!.compare(file2.fileName()!) == (ascending ? .orderedDescending : .orderedAscending)
                }else if sortType == .fileSize {
                    return ascending ? file1.fileSize < file2.fileSize : file1.fileSize > file2.fileSize
                }
                return true
            }
        }
        
        return fileMods
    }
    
    
    
    
}
