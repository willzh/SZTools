//
//  ZSFile.swift
//  ZSFileBrowser
//
//  Created by WillZh on 2018/11/26.
//  Copyright © 2018年 NoOrg. All rights reserved.
//
//
//  文件模型类

import UIKit

class ZSFile: NSObject {

    //MARK: - 参数
    /// 是否被选中，cell 操作参数，非文件属性
    var selected: Bool = false
    
    /// 文件的路径
    var path: String?
    /// 是否文件夹
    var isDir: Bool = false
    /// 文件夹中的文件数量
    var numberOfFiles: Int = 0
    /// 创建日期
    var createDate: Date?
    /// 更新日期
    var modifyDate: Date?
    /// 文件大小
    var fileSize: Int64 = 0
    
    
    
    
    //MARK: - init
    init(path: String) {
        super.init()
        
        self.path = path
    }
    
    
    //MARK: - Public Methods
    /// 格式化的创建日期
    public func formatedCreateDate() -> String? {
        return createDate?.simpleFormatted()
    }
    
    /// 格式化的更新日期
    public func formatedModifyDate() -> String? {
        return modifyDate?.simpleFormatted()
    }
    
    /// 文件的大小描述，ext: 3M, 2G, 20K...
    public func fileSizeDescription() -> String? {
        return formatFileSize();
    }
    
    /// 返回文件名
    public func fileName() -> String? {
        if path == nil  {
            return nil
        }
        let str = path! as NSString
        return str.lastPathComponent;
    }
    
    /// 判断是否 PDF 文件
    public func isPDF() -> Bool {
        if path == nil  {
            return false
        }
        let str = path! as NSString
        return ["pdf"].contains(str.pathExtension)
    }
    
    /// 判断是否图片文件
    public func isImage() -> Bool {
        if path == nil  {
            return false
        }
        let str = path! as NSString
        let exts = ["jpg", "jpeg", "gif", "thm", "bmpf", "bmp", "tif", "tiff", "png", "cur", "xbm", "ico", "icns", "j2k", "tga"]
        return exts.contains(str.pathExtension.lowercased())
    }
    
    /// 判断是否视频文件
    public func isVideo() -> Bool {
        if path == nil  {
            return false
        }
        let str = path! as NSString
        let exts = ["mp4", "mkv", "gif", "thm", "bmpf", "bmp", "tif", "tiff", "png", "cur", "xbm", "ico", "icns", "j2k", "tga"]
        return exts.contains(str.pathExtension.lowercased())
    }
    
    
    
    
    
    
    //MARK: - Private Methods
    private func getAttributes() {
        if (path?.isEmpty)! {
            return
        }
        
        let attrDict = try? FileManager.default.attributesOfItem(atPath: path!)
        print("attrDict:%@", attrDict ?? "")
        
        if attrDict == nil {
            return
        }
        
        isDir = attrDict![.type] as? FileAttributeType == .typeDirectory
        if isDir {
            numberOfFiles = numberOfFiles(path!, traverse: false)
        }
        
        createDate = attrDict![.creationDate] as? Date
        modifyDate = attrDict![.modificationDate] as? Date
        
        fileSize = attrDict![.size] as! Int64 / 1024
        
    }
    
    
    /// 格式化文件大小
    private func formatFileSize() -> String {
        
        let g: Int64 = 1048576
        let m: Int64 = 1024
        
        var size = fileSize
        var unit = "K"
        if fileSize >= m
        {
            if fileSize < g
            {
                size = fileSize / m
                unit = "M"
            }else
            {
                size = fileSize / g
                unit = "G"
            }
        }
        return String(format: "%d%@B", size, unit)
    }
    
    /// 获取文件夹中文件数量
    private func numberOfFiles(_ inDir: String, traverse: Bool) -> Int {
        let fileMan = FileManager.default
        
        var isDirectory: ObjCBool = false
        if fileMan.fileExists(atPath: inDir, isDirectory: &isDirectory)
        {
            print("获取文件夹中文件数量错误，文件不存在或路径非文件夹")
            return 0
        }
        
        let contents = try? fileMan.contentsOfDirectory(atPath: inDir)
        if contents == nil {
            return 0
        }
        
        if !traverse {
            return contents!.count
        }
        
        var count = 0
        for path in contents!
        {
            let subPath = inDir.appendingFormat("/%@", path)
            var isDirectory: ObjCBool = true
            if fileMan.fileExists(atPath: inDir, isDirectory: &isDirectory) {
                count += numberOfFiles(subPath, traverse: traverse)
            }else {
                count += 1
            }
        }
        return count
    }
    
    
    
}
