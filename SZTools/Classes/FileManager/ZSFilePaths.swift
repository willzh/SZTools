//
//  ZSFilePaths.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/28.
//  Copyright © 2018年 NoOrg. All rights reserved.
//

import Foundation


/// Documents 路径
func path_documents() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    if paths.count > 0 {
        return paths.last!
    }
    return NSHomeDirectory() + "/Documents"
}

/// Library 路径
func path_library() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
    if paths.count > 0 {
        return paths.last!
    }
    return NSHomeDirectory() + "/Library"
}

/// Caches 路径
func path_cache() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    if paths.count > 0 {
        return paths.last!
    }
    return NSHomeDirectory() + "/Library/Caches"
}

/// tmp 路径
func path_tmp() -> String {
    return NSTemporaryDirectory()
}

/// 返回一个隐藏文件夹的路径。dirName：文件夹名称。inDir：上一级文件夹路径
func hiddenDirectory(dirName: String, inDir: String) -> String {
    return inDir + "/." + dirName
}

