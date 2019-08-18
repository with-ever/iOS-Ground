//
//  IntExtension.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension Int {

    // True / False
    public func asBool() -> Bool! {
        if self == 1 {
            return true
        } else {
            return false
        }
    }
    
    // 3자리마다 콤마로 구별
    var withComma: String? {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        decimalFormatter.groupingSeparator = ","
        decimalFormatter.groupingSize = 3
        
        return decimalFormatter.string(from: self as NSNumber)!
    }
    
    // 랜덤 숫자
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.lowerBound < 0 {
            offset = Swift.abs(range.lowerBound)
        }
        
        let mini = UInt32(range.lowerBound + offset)
        let maxi = UInt32(range.upperBound   + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
 
}

extension Int {
    
    // 단위별 포멧 숫자 표기
    func formatNumber() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            if (self % 1000000000) < 100000000 {
                return String(format: "%dB", Int(self / 1000000000))
            } else {
                formatted = formatted.truncate(places: 1)
                return "\(sign)\(formatted)B"
            }
            
        case 1_000_000...:
            var formatted = num / 1_000_000
            if (self % 1000000) < 100000 {
                return String(format: "%dM", Int(self / 1000000))
            } else {
                formatted = formatted.truncate(places: 1)
                return "\(sign)\(formatted)M"
            }
            
        case 1_000...:
            var formatted = num / 1_000
            if (self % 1000) < 100 {
                return String(format: "%dK", Int(self / 1000))
            } else {
                formatted = formatted.truncate(places: 1)
                return "\(sign)\(formatted)K"
            }
            
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
            
        }
    }
}
