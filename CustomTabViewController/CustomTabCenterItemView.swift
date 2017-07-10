//
//  CustomTabCenterItemView.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabCenterItemView: UIView {
    
    private let DEFAULT_ROATING_DURATION = 0.5
    private let _margin = CGFloat(10)
    
    
    var tapListener: ((CustomTabCenterItemView) -> Void)?
    
    private var _oldBounds: CGRect?
    
    let iconView: UIImageView
    
    init(icon: UIImage?) {
        iconView = UIImageView(image: icon)
        super.init(frame: CGRect.zero)
        
        setupSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        iconView = UIImageView(image: nil)
        super.init(coder: aDecoder)
        
        setupSubview()
    }
    
    private func setupSubview() {
        self.addSubview(iconView)
        iconView.contentMode = .scaleAspectFit
    }
    
    func roateToAngle (degreeRoateTo: Int) {
        let radius = CGFloat.pi * CGFloat(degreeRoateTo) / 180
        
        UIView.animate(withDuration: TimeInterval(DEFAULT_ROATING_DURATION)
            , delay: TimeInterval(0)
            , usingSpringWithDamping: 0.5
            , initialSpringVelocity: 0.5
            , options: .allowAnimatedContent
            , animations: { [unowned self] in
                self.iconView.transform = CGAffineTransform.init(rotationAngle: radius)
            }
            , completion: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let isBoundsChange = !(_oldBounds?.equalTo(self.bounds) ?? false)
        
        if isBoundsChange {
            _oldBounds = self.bounds
            let innerViewWidth = self.bounds.width - _margin*2
            let innerViewHeight = self.bounds.height - _margin*2
            let innerViewX = _margin
            let innerViewY = _margin
            
            iconView.frame = CGRect(x: innerViewX, y: innerViewY, width: innerViewWidth, height: innerViewHeight)
        }
    }

}
