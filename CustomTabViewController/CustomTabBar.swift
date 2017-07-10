//
//  CustomTabBar.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabBar: UIView {
    private var _tabItems: [CustomTabItem]!
    private var _centerTabItem: CustomTabCenterItem!
    
    private let lineView = UIView()
    
    
    var centerTabItem: CustomTabCenterItem{
        get{
            if let item = _centerTabItem {
                return item
            } else {
                return CustomTabCenterItem(icon: nil)
            }
        }
        set{
            _centerTabItem = newValue
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupSubviews()
    }
    
    init(tabItems: [CustomTabItem], centerTabItem: CustomTabCenterItem){
        super.init(frame: CGRect.zero)
        
        if (tabItems.count != 4) {
            fatalError("The count of the tabitem must be 4.")
        }
        
        self._tabItems = tabItems
        self._centerTabItem = centerTabItem
        
        commonInit()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setupSubviews()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.darkGray
    }
    
    private func setupSubviews() {
        for i in 0..<_tabItems.count {
            if i == 2 {
                self.addSubview(_centerTabItem.view)
                self.centerTabItem.onClickListener = { (centerItem: CustomTabCenterItem) in
                    centerItem.isSelected = !centerItem.isSelected
                }
            }
            self.addSubview(_tabItems[i].view)
            
            _tabItems[i].view.isUserInteractionEnabled = true
            _tabItems[i].onClickListener = { [unowned self] (tabItem: CustomTabItem) in
                self.setItemSelected(item: self._tabItems[i])
            }
        }
        
        // then we make the first one selected by default
        _tabItems[0].isSelected = true
    }
    
    private func setItemSelected(item: CustomTabItem) {
        for obj in _tabItems {
            if item === obj {
                obj.isSelected = true
            } else {
                obj.isSelected = false
            }
        }
    }
    

    override func layoutSubviews() {
        let widthPerItem = self.bounds.width / 5
        let heightPerItem = self.bounds.height
        
        for index in 0..<subviews.count {
            subviews[index].frame = CGRect(x: widthPerItem * CGFloat(index), y: 0, width: widthPerItem, height: heightPerItem)
        }
        
        
    }

}
