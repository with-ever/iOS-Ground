//
//  SystemExtension.swift
//  ground
//
//  Created by TED on 22/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class SystemUtils {
    
    // Device
    public static var uniqueDeviceID: String { return UIDevice.current.identifierForVendor?.uuidString ?? "" }
    public static var osVersion: String { return UIDevice.current.systemVersion }
    
    // App version
    public static var appVersionCode: Int { return Bundle.main.object(forInfoDictionaryKey: "APP_VERSION_CODE") as? Int ?? 0 }
    public static var appVersionName: String { return Bundle.main.object(forInfoDictionaryKey: "APP_VERSION_NAME") as? String ?? "" }
    
    // Screen size
    public static var screenWidth: CGFloat { return UIScreen.main.bounds.size.width }
    public static var screenHeight: CGFloat { return UIScreen.main.bounds.size.height }
    
    // Status Bar
    public static var statusBarHeight: CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return statusBarSize.height
    }
    public static var statusBarWidth: CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return statusBarSize.width
    }
}

extension SystemUtils {
    public static var currentMillionsecond: Double {
        let time = NSDate.init().timeIntervalSince1970
        let decimalDigits = Int(fmod(time, 1) * 1000)
        return (time * 1000) + Double(decimalDigits)
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension SystemUtils {
    public static var countryLocale: Locale { return Locale.current }
    public static var countryCode: String { return Locale.current.regionCode ?? "KO" }
    public static var deviceLanguageCode: String { return Locale.current.languageCode ?? "KR" }
    public static var appLanguageCode: String { return Locale.preferredLanguages[0]}
    
    public static var timeZoneOffset: Int { return NSTimeZone.local.secondsFromGMT() / 3600 }
    public static var localTimeZoneName: String { return TimeZone.current.identifier }
    public static var timeZoneIdentifiers: [String] { return TimeZone.knownTimeZoneIdentifiers }
    
    
//    Locale.availableIdentifiers
//    Locale.isoRegionCodes
//    Locale.isoCurrencyCodes
//    Locale.isoLanguageCodes
//    Locale.commonISOCurrencyCodes
//
//    Locale.current.regionCode           // "US"
//    Locale.current.languageCode         // "en"
//    Locale.current.currencyCode         // "USD"
//    Locale.current.currencySymbol       // "$"
//    Locale.current.groupingSeparator    // ","
//    Locale.current.decimalSeparator     // "."
//    Locale.current.usesMetricSystem     // false
//
//    Locale.windowsLocaleCode(fromIdentifier: "pt_BR")                   //  1,046
//    Locale.identifier(fromWindowsLocaleCode: 1046) ?? ""                // "pt_BR"
//    Locale.windowsLocaleCode(fromIdentifier: Locale.current.identifier) //  1,033 Note: I am in Brasil but I use "en_US" format with all my devices
//    Locale.windowsLocaleCode(fromIdentifier: "en_US")                                   // 1,033
//    Locale.identifier(fromWindowsLocaleCode: 1033) ?? ""                                // "en_US"
//
//    Locale(identifier: "en_US_POSIX").localizedString(forLanguageCode: "pt")            // "Portuguese"
//    Locale(identifier: "en_US_POSIX").localizedString(forRegionCode: "br")              // "Brazil"
//    Locale(identifier: "en_US_POSIX").localizedString(forIdentifier: "pt_BR")           // "Portuguese (Brazil)"
//
//    TimeZone.current.localizedName(for: .standard, locale: .current) ?? ""              // "Brasilia Standard Time"
//    TimeZone.current.localizedName(for: .shortStandard, locale: .current) ?? ""         // "GMT-3
//    TimeZone.current.localizedName(for: .daylightSaving, locale: .current) ?? ""        // "Brasilia Summer Time"
//    TimeZone.current.localizedName(for: .shortDaylightSaving, locale: .current) ?? ""   // "GMT-2"
//    TimeZone.current.localizedName(for: .generic, locale: .current) ?? ""               // "Brasilia Time"
//    TimeZone.current.localizedName(for: .shortGeneric, locale: .current) ?? ""          // "Sao Paulo Time"
//
//    var timeZone: String {
//        return TimeZone.current.localizedName(for: TimeZone.current.isDaylightSavingTime() ?
//            .daylightSaving :
//            .standard,
//                                              locale: .current) ?? "" }
//
//    timeZone       // "Brasilia Summer Time"

}

