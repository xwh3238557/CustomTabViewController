//
//  CustomTabCenterItemView.swift
//  CustomTabViewController
//
//  Created by 夏文皓 on 2017/2/7.
//  Copyright © 2017年 夏文皓. All rights reserved.
//

import UIKit

class CustomTabCenterItemView: UIView {

    let margin = CGFloat(10)
    
    private var _isSelected = false
    
    private var tapListener: ((CustomTabCenterItemView) -> Void)?
    
    private let innerView: UIImageView
    
    var isSelected: Bool{
        get{
            return _isSelected
        }
    }
    
    init(item: CustomTabCenterItem) {
        innerView = UIImageView(image: item.image)
       
        super.init(frame: CGRect.zero)
        self.addSubview(innerView)
        
        innerView.isUserInteractionEnabled = true
        innerView.contentMode = .scaleAspectFit
       
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CustomTabCenterItemView.handleTap)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    @objc
    private func handleTap() {
        _isSelected = !_isSelected
        let roatet = -CGFloat.pi*3/4
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .allowAnimatedContent,
                       animations: { [unowned self] in
                            if self._isSelected {
                                self.innerView.transform = CGAffineTransform(rotationAngle: roatet)
                            } else {
                                self.innerView.transform = CGAffineTransform(rotationAngle: 0)
                            }
                        },
                       completion: {Void in
                        
                        }
        )
        
        if let listener = tapListener {
            listener(self)
        }
    }
    
    func setOnTapListener(tapListener: ((CustomTabCenterItemView) -> Void)?){
        self.tapListener = tapListener
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let innerViewWidth = self.bounds.width - margin*2
        let innerViewHeight = self.bounds.height - margin*2
        
        let innerViewX = margin
        let innerViewY = margin
        
        innerView.frame = CGRect(x: innerViewX, y: innerViewY, width: innerViewWidth, height: innerViewHeight)
    }

}
