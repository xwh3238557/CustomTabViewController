//
//  CustomTabItem.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabItem: NSObject {
    //this is the title which will display on the bottom of the view
    var title: String? {
        return self.view.title
    }
    
    //this color will use to display the title when the title is not in highlight
    var titleColor: UIColor {
        return self.view.titleColor
    }
    
    var defaultTitleColor: UIColor! {
        willSet{
            if defaultTitleColor == newValue {
                return
            } else if !isSelected {
                self.view.titleColor = defaultTitleColor
            }
        }
    }
    var selectedTitleColor: UIColor! {
        willSet{
            if selectedTitleColor == newValue {
                return
            } else if isSelected {
                self.view.titleColor = selectedTitleColor
            }
        }
    }
    
    // this is the icon for the item when the item is not highlight
    var icon: UIImage? {
        return self.view.icon
    }
    
    var defaultIcon: UIImage? {
        willSet {
            if defaultIcon == newValue {
                return
            } else if !isSelected {
                self.view.icon = defaultIcon
            }
        }
    }
    
    //this is the icon for the item when the item is in highlight
    var selectedIcon: UIImage? {
        willSet {
            if selectedIcon == newValue {
                return
            } else if isSelected {
                self.view.icon = selectedIcon
            }
        }
    }
    
    var onClickListener: ((CustomTabItem) -> Void)?

    
    let view: CustomTabItemView!
    
    var isSelected: Bool {
        didSet {
            if oldValue == isSelected {
                return
            } else {
                if isSelected {
                    self.view.icon = selectedIcon
                    self.view.titleColor = selectedTitleColor
                } else {
                    self.view.icon = defaultIcon
                    self.view.titleColor = defaultTitleColor
                }
            }
        }
    }
    
    init(title: String? = nil,
        defaultTitleColor: UIColor = UIColor.gray,
        selectedTitleColor: UIColor = UIColor(red: 0.133, green: 0.788, blue: 0.909, alpha: 1.0),
        defaultIcon: UIImage? = nil,
        selectedIcon: UIImage? = nil) {
        self.view = CustomTabItemView()

        self.view.title = title

        self.defaultTitleColor = defaultTitleColor
        self.selectedTitleColor = selectedTitleColor

        self.defaultIcon = defaultIcon
        self.selectedIcon = selectedIcon
        
        self.isSelected = false
        self.view.icon = defaultIcon
        self.view.titleColor = defaultTitleColor

        super.init()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CustomTabItem.onClick)))
    }
    
    @objc
    private func onClick(recongnizer: UITapGestureRecognizer) {
        if let listener = onClickListener {
            listener(self)
        }
    }
    
}
