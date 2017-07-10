//
//  CustomTabItemView.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabItemView: UIView {
    let margin = CGFloat(3)
    
    // this is the icon view of this view
    private var _iconView: UIImageView!
    //this is the title view of this view
    private var _titleView: UILabel!
    
    var titleColor: UIColor {
        set {
            _titleView.textColor = newValue
        }
        get {
            return _titleView.textColor
        }
    }
    
    var title: String? {
        set {
            _titleView.text = newValue
        }
        get {
            return _titleView.text
        }
    }
    
    var icon: UIImage? {
        set {
            _iconView.image = newValue
        }
        get {
            return _iconView.image
        }
    }
    
    init(title: String? = nil, titleColor: UIColor = UIColor.gray, icon: UIImage? = nil) {
        super.init(frame: CGRect.zero)
        initSubviews()
        
        self.icon       = icon
        self.title      = title
        self.titleColor = titleColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    private func initSubviews() {
        _iconView = UIImageView(frame: CGRect.zero)
        _iconView.contentMode = .scaleAspectFit
        self.addSubview(_iconView)
        
        _titleView = UILabel(frame: CGRect.zero)
        _titleView.textAlignment = .center
        self.addSubview(_titleView)
    }
    
    override func layoutSubviews() {
        let iconViewHeight = self.bounds.height / 7*5 - margin * 2
        let iconViewWidth = self.bounds.width - margin * 2
        
        let titleViewWidth = self.bounds.width - margin * 2
        let titleViewHeight = self.bounds.height / 7*2 - margin * 2
    
        _iconView.frame = CGRect(x: margin, y: margin, width: iconViewWidth, height: iconViewHeight)
        
        _titleView.frame = CGRect(x: margin, y: 3*margin + iconViewHeight, width: titleViewWidth, height: titleViewHeight)
        _titleView.font = UIFont.systemFont(ofSize: titleViewHeight)
    }
}
