//
//  CGFloatExtension.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

///----------------------------------------------------
/// 반올림 / 올림
///----------------------------------------------------
extension CGFloat {
    
    // 반올림
    func numberRoundOff() -> CGFloat {
        if self == 0 {
            return 0
        }
        
        return CGFloat(Int((self + 5) / 10) * 10)
    }
    
    // 올림
    func numberUpper() -> CGFloat {
        if self == 0 {
            return 0
        }
        
        return CGFloat(Int((self + 9) / 10) * 10)
    }
    
    // 소수점 이하 자릿수 값으로 반올림
    func rounded(toPlaces places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
    
}


///----------------------------------------------------
/// Currency
///----------------------------------------------------
extension CGFloat {

    // 통화 자릿수 적용 & Symbol 추가
    func currencySymbol(currencyCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        switch currencyCode {
        case "usd": // 미국
            formatter.locale = Locale.init(identifier: "en_US")
            formatter.currencySymbol = "USD"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "cny": // 중국
            formatter.locale = Locale.init(identifier: "zh_Hans_CN")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "sgd": // 싱가폴
            formatter.locale = Locale.init(identifier: "en_SG")
            formatter.currencySymbol = "SGD"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "thb": // 태국
            formatter.locale = Locale.init(identifier: "th_TH")
            formatter.currencySymbol = "฿"
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "myr": // 말레이시아
            formatter.locale = Locale.init(identifier: "ms_MY")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "idr": // 인도네시아
            formatter.locale = Locale.init(identifier: "id_ID")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "php": // 필리핀
            formatter.locale = Locale.init(identifier: "fil_PH")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "vnd": // 베트남
            formatter.locale = Locale.init(identifier: "vi_VN")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "twd": // 대만
            formatter.locale = Locale.init(identifier: "zh_Hant_TW")
            formatter.currencySymbol = "NT$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "krw": // 한국
            formatter.locale = Locale.init(identifier: "ko_KR")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        default: return ""
        }
    }
    
    // 통화 자릿수 적용 - PHP, IDR, MYR 올림 적용
    func currencyRountOff(currencyCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        switch currencyCode {
        case "usd": // 미국
            formatter.locale = Locale.init(identifier: "en_US")
            formatter.currencySymbol = "USD"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "cny": // 중국
            formatter.locale = Locale.init(identifier: "zh_Hans_CN")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "sgd": // 싱가폴
            formatter.locale = Locale.init(identifier: "en_SG")
            formatter.currencySymbol = "SGD"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "thb": // 태국
            formatter.locale = Locale.init(identifier: "th_TH")
            formatter.currencySymbol = "฿"
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "myr": // 말레이시아
            formatter.locale = Locale.init(identifier: "ms_MY")
            formatter.maximumFractionDigits = 2
            
            // 10 단위 올림 처리 된 후에 string 처리
            return formatter.string(from: NSNumber.init(value: Float((ceil(self) / 10) * 10)))!
            
        case "idr": // 인도네시아
            formatter.locale = Locale.init(identifier: "id_ID")
            formatter.maximumFractionDigits = 0
            
            // 1000 단위 올림
            return formatter.string(from: NSNumber.init(value: ceil((Float(self) / 1000)) * 1000))!
            
        case "php": // 필리핀
            formatter.locale = Locale.init(identifier: "fil_PH")
            formatter.maximumFractionDigits = 0
            
            // 10 단위 올림
            return formatter.string(from: NSNumber.init(value: ceil((Float(self) / 10)) * 10))!
            
        case "vnd": // 베트남
            formatter.locale = Locale.init(identifier: "vi_VN")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "twd": // 대만
            formatter.locale = Locale.init(identifier: "zh_Hant_TW")
            formatter.currencySymbol = "NT$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "krw": // 한국
            formatter.locale = Locale.init(identifier: "ko_KR")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        default: return ""
        }
    }
    
    // 국가 코드에 따른 통화 적용
    func currency(countryCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        switch countryCode {
        case "US": // 미국
            formatter.locale = Locale.init(identifier: "en_US")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "CN": // 중국
            formatter.locale = Locale.init(identifier: "zh_Hans_CN")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "SG": // 싱가폴
            formatter.locale = Locale.init(identifier: "en_SG")
            formatter.currencySymbol = "S$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "TH": // 태국
            formatter.locale = Locale.init(identifier: "th_TH")
            formatter.currencySymbol = "฿"
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "MY": // 말레이시아
            formatter.locale = Locale.init(identifier: "ms_MY")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "ID": // 인도네시아
            formatter.locale = Locale.init(identifier: "id_ID")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "PH": // 필리핀
            formatter.locale = Locale.init(identifier: "fil_PH")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "VN": // 베트남
            formatter.locale = Locale.init(identifier: "vi_VN")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "TW": // 대만
            formatter.locale = Locale.init(identifier: "zh_Hant_TW")
            formatter.currencySymbol = "NT$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "KR": // 한국
            formatter.locale = Locale.init(identifier: "ko_KR")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        default: return ""
        }
    }
    
    
    
    // 앱에 설정된 화폐 단위로 가져오기
    func currency(currencyCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        switch currencyCode {
        case "usd":
            formatter.locale = Locale.init(identifier: "en_US")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "cny":
            formatter.locale = Locale.init(identifier: "zh_Hans_CN")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "sgd":
            formatter.locale = Locale.init(identifier: "en_SG")
            formatter.currencySymbol = "S$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "thb":
            formatter.locale = Locale.init(identifier: "th_TH")
            formatter.currencySymbol = "฿"
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "myr":
            formatter.locale = Locale.init(identifier: "ms_MY")
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "idr":
            formatter.locale = Locale.init(identifier: "id_ID")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "php":
            formatter.locale = Locale.init(identifier: "fil_PH")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "vnd":
            formatter.locale = Locale.init(identifier: "vi_VN")
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        case "twd":
            formatter.locale = Locale.init(identifier: "zh_Hant_TW")
            formatter.currencySymbol = "NT$"
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber.init(value: Float(self)))!
            
        default: return ""
        }
    }
}
