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


public enum FileType : Int {
    case folder      //!< 文件夹
    case doc         //!< 文档
    case photo       //!< 图片
    case video       //!< 视频
    case audio       //!< 音频
    case pdf         //!< PDF
    case office      //!< Office
    case other       //!< 其他
}

public class ZSFile: NSObject {

    //MARK: - 参数
    /// 是否被选中，cell 操作参数，非文件属性
    public var selected: Bool = false
    
    /// 文件的路径
    public var path: String = "" {
        didSet {
            getAttributes()
        }
    }
    /// 是否文件夹
    public var isDir: Bool = false
    /// 文件夹中的文件数量
    public var numberOfFiles: Int = 0
    /// 文件夹中的子文件夹数量
    public var numberOfFolders: Int = 0
    /// 创建日期
    public var createDate: Date?
    /// 更新日期
    public var modifyDate: Date?
    /// 文件大小
    public var fileSize: Int64 = 0
    /// 文件类型
    public var fileType: FileType = .other
    
    
    
    //MARK: - init
    public init(_ filePath: String) {
        super.init()
        
        self.path = filePath
        getAttributes() // 在初始化的时候，是不会调用 didSet 方法的，所以要显式调用一次
    }
    
    
    //MARK: - Public Methods
    /// 格式化的创建日期
    public func formatedCreateDate() -> String {
        guard let date = createDate else {
            return ""
        }
        return date.zs_simpleFormatted()
    }
    
    /// 格式化的更新日期
    public func formatedModifyDate() -> String {
        guard let date = modifyDate else {
            return ""
        }
        return date.zs_simpleFormatted()
    }
    
    /// 文件的大小描述，ext: 3M, 2G, 20K...
    public func fileSizeDescription() -> String {
        return formatFileSize();
    }
    
    /// 返回文件名
    public func fileName() -> String {
        let str = path as NSString
        return str.lastPathComponent;
    }
    
    /// 判断是否 PDF 文件
    public func isPDF() -> Bool {
        return checkSuffix(["pdf"])
    }
    
    /// 判断是否图片文件
    public func isPhoto() -> Bool {
        return fileType == .photo
    }
    
    /// 判断是否视频文件
    public func isVideo() -> Bool {
        return fileType == .video
    }
    
    /// 判断是否视频文件
    public func isAudio() -> Bool {
        return fileType == .audio
    }
    
    /// 判断是否文档
    public func isDocs() -> Bool {
        return fileType == .doc
    }
    
    
    
    //MARK: - Private Methods
    private func getAttributes() {
        
        isDir = ZSFileManager.isDir(path)
        if isDir {
            numberOfFiles = numberOfFiles(path)
            numberOfFolders = numberOfFolders(path)
            fileType = .folder
        }else {
            // 文件类型
            let str = path as NSString
            let ext = str.pathExtension.lowercased()
            
            if ext == "pdf" {
                fileType = .pdf
            }else if photoExts().contains(ext) {
                fileType = .photo
            }else if videoExts().contains(ext) {
                fileType = .video
            }else if audioExts().contains(ext) {
                fileType = .audio
            }else if docsExts().contains(ext) {
                fileType = .doc
            }else if officeExts().contains(ext) {
                fileType = .office
            }else {
                fileType = .other
            }
        }
        
        let attrDict = try? FileManager.default.attributesOfItem(atPath: path)
        if attrDict == nil {
            return
        }
        //print("attrDict:%@", attrDict!)
        createDate = attrDict![.creationDate] as? Date
        modifyDate = attrDict![.modificationDate] as? Date
        
        fileSize = attrDict![.size] as! Int64 / 1024
        
    }
    
    /// 检查文件后缀
    private func checkSuffix(_ exts: [String]) -> Bool {
        let str = path as NSString
        return exts.contains(str.pathExtension.lowercased())
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
    private func numberOfFiles(_ inDir: String, traverse: Bool = false) -> Int {
        let fileMan = FileManager.default
        
        if !fileMan.fileExists(atPath: inDir)
        {
            print("获取文件夹中文件数量错误，文件不存在")
            return 0
        }
        if !ZSFileManager.isDir(inDir) {
            print("获取文件夹中文件数量错误，路径非文件夹")
            return 1
        }
        
        let contents = try? fileMan.contentsOfDirectory(atPath: inDir)
        if contents == nil {
            return 0
        }
        
        if !traverse {
            return contents!.count
        }
        
        var count = 0
        for path in contents! {
            let subPath = inDir.appendingFormat("/%@", path)
            count += numberOfFiles(subPath, traverse: traverse)
        }
        return count
    }
    
    
    /// 获取文件夹中子文件夹数量
    private func numberOfFolders(_ inDir: String, traverse: Bool = false) -> Int {
        let fileMan = FileManager.default
        
        if !fileMan.fileExists(atPath: inDir)
        {
            print("获取子文件夹数量错误，文件不存在")
            return 0
        }
        if !ZSFileManager.isDir(inDir) {
            print("获取子文件夹数量错误，路径非文件夹")
            return 0
        }
        
        let contents = try? fileMan.contentsOfDirectory(atPath: inDir)
        if contents == nil {
            return 0
        }
        
        if !traverse {
            var count = 0
            for p in contents! {
                let subPath = inDir.appendingFormat("/%@", p)
                if ZSFileManager.isDir(subPath) {
                    count += 1
                }
            }
            return count
        }
        
        var count = 0
        for p in contents! {
            let subPath = inDir.appendingFormat("/%@", p)
            count += numberOfFiles(subPath, traverse: traverse)
        }
        return count
    }
    
    
    /// 图片后缀
    private func photoExts() -> [String] {
        return ["jpg", "jpeg", "gif", "thm", "bmpf", "bmp", "pcx", "exif", "fpx", "svg", "psd", "tif", "tiff", "png", "cur", "xbm", "ico", "icns", "j2k", "tga", "heic"]
    }
    
    /// 视频后缀
    private func videoExts() -> [String] {
        return ["mp4", "mkv", "rm", "rmvb", "avi", "mov", "wmv", "asf", "3gp", "flv", "f4v", "rmhd", "webm", "mpg", "mpeg", "vob", "swf"]
    }
    
    /// 音频后缀
    private func audioExts() -> [String] {
        return ["mp3", "wav", "wma", "ogg", "aiff", "aac", "avi", "mid", "ape", "flac", "amr"]
    }
    
    /// 文档后缀
    private func docsExts() -> [String] {
        return ["txt", "rtf", "rtfd", "md"]
    }
    
    /// office 文件后缀
    private func officeExts() -> [String] {
        return ["doc", "docx", "xls", "xlsx", "ppt", "pptx", "numbers", "pages", "keynote"]
    }
    
    
}



