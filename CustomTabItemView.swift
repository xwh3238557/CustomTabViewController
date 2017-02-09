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
    private var _iconView: UIImageView!
    private var _titleView: UILabel!
    
    private let _item: CustomTabItem
    
    var onTapListener: ((CustomTabItemView) -> Void)?
    
    var isSelected = false{
        didSet{
            _iconView.isHighlighted = isSelected
            if isSelected {
                _titleView.textColor = _item.highlightedTitleColor
            } else {
                _titleView.textColor = _item.titleColor
            }
        }
    }
    
    init(item: CustomTabItem) {
        self._item = item
        super.init(frame: CGRect.zero)
        _iconView = UIImageView(image: item.image, highlightedImage: item.highlightedImage)
        _iconView.contentMode = .scaleAspectFit
        self.addSubview(_iconView)
        
        _titleView = UILabel(frame: CGRect.zero)
        _titleView.textAlignment = .center
        _titleView.text = item.title
        _titleView.textColor = item.titleColor
        
        self.addSubview(_titleView)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

    }
    
    @objc
    private func handleTap() {
        if let lis = onTapListener {
            lis(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
