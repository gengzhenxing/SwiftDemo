//
//  MyHomeTableViewController.swift
//  MyDemo
//
//  Created by gengzhenxing on 15/12/27.
//  Copyright © 2015年 gengzhenxing. All rights reserved.
//

import UIKit
import Alamofire

class MyHomeTableViewController: UITableViewController {
    
    var result:[HomeInfoModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getHomeInfo()
        
         self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - get network info
    private func getHomeInfo() {
        Alamofire.request(.GET, "http://news-at.zhihu.com/api/4/news/latest", parameters: nil)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    if let array:[Dictionary<String,AnyObject>] = JSON["stories"] as? [Dictionary<String,AnyObject>] {
                        self.result = array.map({ (item) -> HomeInfoModel in
                            let model = HomeInfoModel(dictionary:item)
                            return model
                        })
                    }
                }
        }
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyHomeTableViewCell", forIndexPath: indexPath)

        
        return cell
    }
    
    
    // MARK: Table view delegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}
