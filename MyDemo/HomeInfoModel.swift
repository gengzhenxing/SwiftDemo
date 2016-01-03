//
//  HomeInfoModel.swift
//  MyDemo
//
//  Created by gengzhenxing on 16/1/3.
//  Copyright © 2016年 gengzhenxing. All rights reserved.
//

import UIKit

class HomeInfoModel {
    var ga_prefix:String?
    var id:Int?
    var images:[String]?
    var title:String?
    var type:Int?
    var imageUrl:NSURL?
    
    init(dictionary:Dictionary<String,AnyObject>) {
        ga_prefix = dictionary["ga_prefix"] as? String
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        type = dictionary["type"] as? Int
        imageUrl = NSURL(string: (dictionary["images"]![0] as! String))
    }
    
}
