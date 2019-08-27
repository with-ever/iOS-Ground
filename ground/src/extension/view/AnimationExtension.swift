//
//  AnimationExtension.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension UIView {

    public func fadeIn(duration: TimeInterval = 3, delay: TimeInterval = 0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    public func fadeOut(duration: TimeInterval = 3, delay: TimeInterval = 0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}
