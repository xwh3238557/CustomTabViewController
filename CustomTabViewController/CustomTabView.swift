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
    
    private var _mainView: UIView
    
    private var _tabView: CustomTabBar
    
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

        _tabView = CustomTabBar(firstTabItem: nil, secondTabItem: nil, thirdTabItem: nil, fouthTabItem: nil, centerTabItem: nil)
      
        super.init(frame: frame)

        self.addSubview(mainView)
        self.addSubview(tabView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        _mainView = UIView(frame: CGRect.zero)

        _tabView = CustomTabBar(firstTabItem: CustomTabItem(title: "one", image: UIImage(named: "first_d"), highlightedImage: UIImage(named: "first")),
                                secondTabItem: CustomTabItem(title: "two", image: UIImage(named: "second_d"), highlightedImage: UIImage(named: "second")),
                                thirdTabItem: CustomTabItem(title: "three", image: UIImage(named: "third_d"), highlightedImage: UIImage(named: "third")),
                                fouthTabItem: CustomTabItem(title: "four", image: UIImage(named: "fouth_d"), highlightedImage: UIImage(named: "fouth")),
                                centerTabItem: CustomTabCenterItem(image: UIImage(named: "plus")))

        super.init(coder: aDecoder)
    
        self.addSubview(mainView)
        self.addSubview(tabView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        var tabViewHeight = self.bounds.height/9
        let tabViewWidth = self.bounds.width
        
        if tabViewHeight < MINI_TAB_HIGHT {
            tabViewHeight = MINI_TAB_HIGHT
        }
        
        let mainViewHeight = self.bounds.height - tabViewHeight
        let mainViewWidth = self.bounds.width
        
       
        if self.subviews.contains(mainView) {
            mainView.frame = CGRect(x: 0, y: 0, width: mainViewWidth, height: mainViewHeight)
        }
    
    

        if self.subviews.contains(tabView) {
            tabView.frame = CGRect(x: 0, y: mainViewHeight, width: tabViewWidth, height: tabViewHeight)
        }
        
    }
}
