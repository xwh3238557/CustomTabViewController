//
//  CustomTabCenterItem.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabCenterItem: NSObject {
    var icon: UIImage? {
        get {
            return self.view.iconView.image
        }
        set {
            self.view.iconView.image = newValue
        }
    }
    
    var onClickListener: ((CustomTabCenterItem) -> Void)?
    
    private var _isSelected = false
    
    let view: CustomTabCenterItemView!
    
    var isSelected: Bool{
        get {
            return _isSelected
        }
        
        set {
            if newValue == isSelected {
                return
            }else {
                _isSelected = newValue
                if newValue {
                    self.view.roateToAngle(degreeRoateTo: 225)
                } else {
                    self.view.roateToAngle(degreeRoateTo: 0)
                }
            }
        }
    }
    
    init(icon: UIImage?) {
        view = CustomTabCenterItemView(icon: icon)
        super.init()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CustomTabCenterItem.onClick)))
    }
    
    @objc
    func onClick(recongnizer: UITapGestureRecognizer) {
        unowned let unownedSelf = self
        
        if let listener = onClickListener {
            listener(unownedSelf)
        }
    }
    
}
