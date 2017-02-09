//
//  CustomTabItem.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabItem: NSObject {

    let title: String?
    var titleColor: UIColor
    var highlightedTitleColor: UIColor
    
    let image: UIImage?
    let highlightedImage: UIImage?
    
    init(title: String? = nil, titleColor: UIColor = UIColor.gray, highlightedTitleColor: UIColor = UIColor(red: 0.133, green: 0.788, blue: 0.909, alpha: 1.0), image: UIImage? = nil, highlightedImage: UIImage? = nil) {
        self.title = title
        self.image = image
        self.highlightedImage = highlightedImage
        self.titleColor = titleColor
        self.highlightedTitleColor = highlightedTitleColor
        
        super.init()
    }

}
