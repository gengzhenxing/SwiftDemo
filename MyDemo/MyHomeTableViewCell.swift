//
//  MyHomeTableViewCell.swift
//  MyDemo
//
//  Created by gengzhenxing on 15/12/27.
//  Copyright © 2015年 gengzhenxing. All rights reserved.
//

import UIKit

class MyHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeImageView: UIImageView!
    
    @IBOutlet weak var homeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
