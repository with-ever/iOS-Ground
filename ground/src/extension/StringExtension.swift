//
//  StringExtension.swift
//  ground
//
//  Created by TED on 18/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension String {

    var withComma: String {
        if self.count > 0 {
            return self.replacingOccurrences(of: ",", with: "")
        } else {
            return "0"
        }
    }
    
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    
    ///----------------------------------------------------
    /// Language Localized
    ///----------------------------------------------------
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }

    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
    
}
