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
    
    var result = [HomeInfoModel]()
    
    var myCell:MyHomeTableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getHomeInfo()
        
         self.tableView.tableFooterView = UIView()
        
        myCell = tableView.dequeueReusableCellWithIdentifier("MyHomeTableViewCell") as! MyHomeTableViewCell
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
                        
                        self.tableView.reloadData()
                    }
                }
        }
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:MyHomeTableViewCell = tableView.dequeueReusableCellWithIdentifier("MyHomeTableViewCell", forIndexPath: indexPath) as! MyHomeTableViewCell
        cell.configCellWithModel(self.result[indexPath.row])
        
        return cell
    }
    
    
    // MARK: Table view delegate
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let model = result[indexPath.row]
        myCell.homeLabel.text = model.title
        return myCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
