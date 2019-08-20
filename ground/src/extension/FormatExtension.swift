//
//  FormatExtension.swift
//  ground
//
//  Created by TED on 21/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

///----------------------------------------------------
/// Validation
///----------------------------------------------------
extension String {

    // Email validation check
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    // Password validation check
    var isValidPassword: Bool {
        // check 문자 + 숫자
        let emailRegEx1 = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{1,}$"
        let emailPred1 = NSPredicate(format:"SELF MATCHES %@", emailRegEx1)
        if emailPred1.evaluate(with: self) {
            return true
        }
        
        // check 문자 + 특수문자
        let emailRegEx2 = "^(?=.*[A-Za-z])(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{1,}$"
        let emailPred2 = NSPredicate(format:"SELF MATCHES %@", emailRegEx2)
        if emailPred2.evaluate(with: self) {
            return true
        }
        
        // check 문자 + 숫자
        let emailRegEx3 = "^(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{1,}$"
        let emailPred3 = NSPredicate(format:"SELF MATCHES %@", emailRegEx3)
        if emailPred3.evaluate(with: self) {
            return true
        }
        
        // check 문자 + 숫자 + 특수문자
        let emailRegEx4 = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{1,}$"
        let emailPred4 = NSPredicate(format:"SELF MATCHES %@", emailRegEx4)
        if emailPred4.evaluate(with: self) {
            return true
        }
        
        return false
    }
    
    // URL validation check
    var isValidURL: Bool {
        let emailRegEx4 = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{1,}$"
        let emailPred4 = NSPredicate(format:"SELF MATCHES %@", emailRegEx4)
        if emailPred4.evaluate(with: self) {
            return true
        }
        
        return false
    }
    
}


///----------------------------------------------------
/// Check null
///----------------------------------------------------
extension String {
    /**
     * Check null
     * @return true: null, false: not null
     */
    var checkNull: Bool {
        if self.isEmpty {
            return true
        }
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
}

///----------------------------------------------------
/// Format
///----------------------------------------------------
extension String {
    public static func stringFromTimeInterval(interval: TimeInterval) -> String {
        let time = Int(interval)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        return NSString.init(format: "%02d:%02d:%02d", hours, minutes, seconds) as String
    }
}
