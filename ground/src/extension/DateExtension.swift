//
//  DateExtension.swift
//  ground
//
//  Created by TED on 20/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension Date {
    
    var currentUnixTime: TimeInterval {
        return self.timeIntervalSince1970
    }
 
    func getDateUnixTime(unixTime: Double, format: String?) -> String {
        let stringFormat = format ?? "yyyy-MM-dd HH:mm"
        
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = stringFormat
        
        return dateFormatter.string(from: date)
    }
    
}

extension Date {
    func getMonthString(month: Int?) -> String {
        switch (month) {
        case 1: return "JAN"
        case 2: return "FAB"
        case 3: return "MAR"
        case 4: return "APR"
        case 5: return "MAY"
        case 6: return "JUN"
        case 7: return "JUL"
        case 8: return "AUG"
        case 9: return "SEP"
        case 10: return "OCT"
        case 11: return "NOV"
        case 12: return "DEC"
        default: return ""
        }
    }
    
    func getCurrentHour() -> String {
        return getDateUnixTime(unixTime: currentUnixTime, format: "HH")
    }
    
    func getCurrentMin() -> String {
        return getDateUnixTime(unixTime: currentUnixTime, format: "mm")
    }
    
    func getCurrentSec() -> String {
        return getDateUnixTime(unixTime: currentUnixTime, format: "ss")
    }
}
