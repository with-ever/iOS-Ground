//
//  ViewExtension.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension UIView {

    // Border
    public func drawBorder(color: UIColor = UIColor.lightGray, borderWidth: CGFloat = 1.0, radius: CGFloat = 0.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
    }
    
    // RoundBorder
    public func drawRoundBorder(color: UIColor = UIColor.lightGray, borderWidth: CGFloat = 1.0, radius: CGFloat = 0.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    // Shadow
    public func shadowLine(color: UIColor = UIColor.lightGray, radius: CGFloat = 1.0, opacity: Float = 1.0, offset: CGSize = CGSize.zero) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
    }

    // Circle
    public func circleView(color: UIColor = UIColor.lightGray, borderWidth: CGFloat = 0.0) {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    
}
