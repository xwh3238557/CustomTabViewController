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
    
    var onTapListener: ((CustomTabItemView) -> Void)?
    
    var isSelected = false{
        didSet{
            _iconView.isHighlighted = isSelected
        }
    }
    
    init(item: CustomTabItem) {
        super.init(frame: CGRect.zero)
        _iconView = UIImageView(image: item.image, highlightedImage: item.highlightedImage)
        _iconView.contentMode = .scaleAspectFit

        
        
        _titleView = UILabel(frame: CGRect.zero)
        _titleView.textAlignment = .center
        _titleView.text = item.title
        _titleView.textColor = item.titleColor
        _titleView.font = UIFont.systemFont(ofSize: 12)
        
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
        let iconViewHeight = self.bounds.height / 5*3 - margin * 2
        let iconViewWidth = self.bounds.width - margin * 2
        
        let titleViewWidth = self.bounds.width - margin * 2
        let titleViewHeight = self.bounds.height / 5*2 - margin * 2
    
        if _iconView.superview != self  {
            self.addSubview(_iconView)
        }
        _iconView.frame = CGRect(x: margin, y: margin, width: iconViewWidth, height: iconViewHeight)
        
        
        if _titleView.superview != self {
            self.addSubview(_titleView)
        }
        _titleView.frame = CGRect(x: margin, y: 2*margin + iconViewHeight, width: titleViewWidth, height: titleViewHeight)
        
        
    }
}
