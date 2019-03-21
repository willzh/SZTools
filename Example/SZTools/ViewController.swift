//
//  ViewController.swift
//  SZTools
//
//  Created by willzh on 01/07/2019.
//  Copyright (c) 2019 willzh. All rights reserved.
//

import UIKit
import SZTools




class ViewController: UIViewController {

    @IBOutlet var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = screenSize()
        _ = screenWidth()
        
        //table?.registerCellClass(ZSNoDataTableCell.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

