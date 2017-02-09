//
//  CustomTabBar.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabBar: UIView {
    
    private let DEFAULT_FIRST_BUTTON_NAME = "1"
    private let DEFAULT_SECOND_BUTTON_NAME = "2"
    private let DEFAULT_THIRD_BUTTON_NAME = "3"
    private let DEFAULT_FOUTH_BUTTON_NAME = "4"
    private let DEFAULT_CENTER_BUTTON_NAME = "c"
    
    private var _firstTabItem: CustomTabItem?
    private var _secondTabItem: CustomTabItem?
    private var _thirdTabItem: CustomTabItem?
    private var _fouthTabItem: CustomTabItem?
    private var _centerTabItem: CustomTabCenterItem?
    
    private var _firstTab: CustomTabItemView!
    private var _secondTab: CustomTabItemView!
    private var _thirdTab: CustomTabItemView!
    private var _fouthTab: CustomTabItemView!
    private var _centerTab: CustomTabCenterItemView!
    
    private var _selectedTab: CustomTabItemView!{
        didSet{
            if let old = oldValue {
                old.isSelected = false
            }
            _selectedTab.isSelected = true
        }
    }
    
    
    private let lineView = UIView()
    
    var firstTabItem: CustomTabItem{
        get{
            if let item = _firstTabItem {
                return item
            } else {
                return CustomTabItem(title: DEFAULT_FIRST_BUTTON_NAME)
            }
        }
        set{
            _firstTabItem = newValue
        }
    }
    
    var secondTabItem: CustomTabItem{
        get{
            if let item = _secondTabItem {
                return item
            } else {
                return CustomTabItem(title: DEFAULT_SECOND_BUTTON_NAME)
            }
        }
        set{
            _secondTabItem = newValue
        }
    }
    
    var thirdTabItem: CustomTabItem{
        get{
            if let item = _thirdTabItem {
                return item
            } else {
                return CustomTabItem(title: DEFAULT_THIRD_BUTTON_NAME)
            }
        }
        set{
            _thirdTabItem = newValue
        }
    }
    
    var fouthTabItem: CustomTabItem{
        get{
            if let item = _fouthTabItem {
                return item
            } else {
                return CustomTabItem(title: DEFAULT_FOUTH_BUTTON_NAME)
            }
        }
        set{
            _fouthTabItem = newValue
        }
    }
    
    var centerTabItem: CustomTabCenterItem{
        get{
            if let item = _centerTabItem {
                return item
            } else {
                return CustomTabCenterItem(image: nil)
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
    
    init(firstTabItem: CustomTabItem?, secondTabItem: CustomTabItem?, thirdTabItem: CustomTabItem?, fouthTabItem: CustomTabItem?, centerTabItem: CustomTabCenterItem?){
        super.init(frame: CGRect.zero)

        self._firstTabItem = firstTabItem
        self._secondTabItem = secondTabItem
        self._thirdTabItem = thirdTabItem
        self._fouthTabItem = fouthTabItem
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
        _firstTab = CustomTabItemView(item: firstTabItem)
        _secondTab = CustomTabItemView(item: secondTabItem)
        _thirdTab = CustomTabItemView(item: thirdTabItem)
        _fouthTab = CustomTabItemView(item: fouthTabItem)
        
        let tabs: [CustomTabItemView] = [_firstTab, _secondTab, _thirdTab, _fouthTab]
        
        for tab in tabs {
            tab.onTapListener = {[unowned self] (view: CustomTabItemView) -> Void in
                self._selectedTab = view
            }
        }
        
        _centerTab = CustomTabCenterItemView(item: centerTabItem)
        
        self.addSubview(_firstTab)
        self.addSubview(_secondTab)
        self.addSubview(_centerTab)
        self.addSubview(_thirdTab)
        self.addSubview(_fouthTab)
        
        _selectedTab = _firstTab
    }
    

    override func layoutSubviews() {
        let widthPerItem = self.bounds.width / 5
        let heightPerItem = self.bounds.height
        
        for index in 0..<subviews.count {
            subviews[index].frame = CGRect(x: widthPerItem * CGFloat(index), y: 0, width: widthPerItem, height: heightPerItem)
        }
        
        
    }

}
