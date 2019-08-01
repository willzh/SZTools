//
//  ViewController.swift
//  SZTools
//
//  Created by willzh on 01/07/2019.
//  Copyright (c) 2019 willzh. All rights reserved.
//

import UIKit
//import SZTools




class ViewController: UIViewController {

    @IBOutlet var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table?.registerCellClass(ZSNoDataTableCell.self)
        
        print("documents: \(path_documents())")
        
        let path = path_documents() + "/itunes.pdf"
        NSLog("path:%@", path)
        let file = ZSFile(path)
        print("file type: \(file.fileType)")
        
        print("new path: \(ZSFileManager.getValidPath(path)!)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        
        let d1 = df.date(from: "2019-07-30 13:24")
        let d2 = df.date(from: "2019-07-30 13:30")
        
        print("d1: " + d1!.zs_simpleFormatted())
        print("d2: " + d2!.zs_simpleFormatted())
        
        
        
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.height
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueCell(ZSNoDataTableCell.self) as! ZSNoDataTableCell
//
//        cell.offsetY = 20.0
//        cell.label_title.text = "empty cell"
//        //cell.layoutIfNeeded()
//
//        return cell;
//    }
    
}

