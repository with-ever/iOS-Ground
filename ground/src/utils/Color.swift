//
//  Color.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class Color: UIColor {
    
    public static func getKeyColor() -> UIColor {
        return UIColor(red:0.96, green:0.71, blue:0.25, alpha:1.0)
    }
    
    ///----------------------------------------------------
    /// SNS
    ///----------------------------------------------------
    public static func facebookColor() -> UIColor {
        return UIColor(red:0.18, green:0.41, blue:0.68, alpha:1.00)
    }
    
    public static func googleColor() -> UIColor {
        return UIColor(red:0.79, green:0.05, blue:0.07, alpha:1.00)
    }
    
    public static func lineColor() -> UIColor {
        return UIColor(red:0.12, green:0.79, blue:0.18, alpha:1.00)
    }
    
    
    ///----------------------------------------------------
    /// Get Hex to Color
    ///----------------------------------------------------
    public static func getColor(hexString: String) -> UIColor {
        var rgb: UInt32 = 0
        
        guard Scanner(string: hexString).scanHexInt32(&rgb) else {
            return self.clear
        }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}

