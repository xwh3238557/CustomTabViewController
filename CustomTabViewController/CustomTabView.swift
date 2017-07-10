//
//  CustomTabView.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabView: UIView {
    
    let MINI_TAB_HIGHT = CGFloat(50)
    
    private let _mainView: UIView
    
    private let _tabView: CustomTabBar
    
    var mainView: UIView{
        get{
            return _mainView
        }
    }
    
    var tabView: CustomTabBar{
        get{
            return _tabView
        }
    }
    
    override init(frame: CGRect) {
        _mainView = UIView(frame: CGRect.zero)
        
        let tabItems = [
            CustomTabItem(title: "one"
                , defaultIcon: UIImage(named: "first_d")
                , selectedIcon: UIImage(named: "first"))
            , CustomTabItem(title: "two"
                , defaultIcon: UIImage(named: "second_d")
                , selectedIcon: UIImage(named: "second"))
            , CustomTabItem(title: "three"
                , defaultIcon: UIImage(named: "third_d")
                , selectedIcon: UIImage(named: "third"))
            , CustomTabItem(title: "four"
                , defaultIcon: UIImage(named: "fouth_d")
                , selectedIcon: UIImage(named: "fouth"))
        ]
        
        let centerItem = CustomTabCenterItem(icon: UIImage(named: "plus"))
        
        _tabView = CustomTabBar(tabItems: tabItems, centerTabItem: centerItem)

        super.init(frame: frame)
        
        self.addSubview(mainView)
        self.addSubview(tabView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        _mainView = UIView(frame: CGRect.zero)
        
        let tabItems = [
            CustomTabItem(title: "one"
                , defaultIcon: UIImage(named: "first_d")
                , selectedIcon: UIImage(named: "first"))
            , CustomTabItem(title: "two"
                , defaultIcon: UIImage(named: "second_d")
                , selectedIcon: UIImage(named: "second"))
            , CustomTabItem(title: "three"
                , defaultIcon: UIImage(named: "third_d")
                , selectedIcon: UIImage(named: "third"))
            , CustomTabItem(title: "four"
                , defaultIcon: UIImage(named: "fouth_d")
                , selectedIcon: UIImage(named: "fouth"))
        ]
        
        let centerItem = CustomTabCenterItem(icon: UIImage(named: "plus"))
        
        _tabView = CustomTabBar(tabItems: tabItems, centerTabItem: centerItem)

        super.init(coder: aDecoder)
        
        self.addSubview(mainView)
        self.addSubview(tabView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        var tabViewHeight   = self.bounds.height/9
        let tabViewWidth    = self.bounds.width
        
        if tabViewHeight < MINI_TAB_HIGHT {
            tabViewHeight = MINI_TAB_HIGHT
        }
        
        let mainViewHeight  = self.bounds.height - tabViewHeight
        let mainViewWidth   = self.bounds.width
        
       
        if self.subviews.contains(mainView) {
            mainView.frame = CGRect(x: 0, y: 0, width: mainViewWidth, height: mainViewHeight)
        }
    
    

        if self.subviews.contains(tabView) {
            tabView.frame = CGRect(x: 0, y: mainViewHeight, width: tabViewWidth, height: tabViewHeight)
        }
        
    }
}
