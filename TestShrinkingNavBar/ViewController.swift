//
//  ViewController.swift
//  PVSCollapsibleNavigationBar
//
//  Created by Paul Von Schrottky on 4/3/15.
//  Copyright (c) 2015 Paul Von Schrottky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up the collapsible bar.
        self.navigationController?.pvs_collapsibleBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //#pragma - mark UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel!.text = String(indexPath.row)
        return tableViewCell
    }
    
    //#pragma - mark UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //#pragma - mark UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.navigationController?.pvs_collapisbleBarScrollViewDidScroll(scrollView)
    }

}

