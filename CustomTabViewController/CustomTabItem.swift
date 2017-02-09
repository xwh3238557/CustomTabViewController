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
    var titleColor = UIColor.gray
    var highlightedTitleColor = UIColor.blue
    
    let image: UIImage?
    let highlightedImage: UIImage?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String? = nil, image: UIImage? = nil, highlightedImage: UIImage? = nil) {
        self.title = title
        self.image = image
        self.highlightedImage = highlightedImage
    }

}
