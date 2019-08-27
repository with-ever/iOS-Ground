//
//  JsonExtension.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class JsonUtils {
    
    public static func getJsonString(_ data: Any?) -> String {
        if let theJSONData = try? JSONSerialization.data(withJSONObject: data as Any, options: []) {
            let theJSONText = String(data: theJSONData, encoding: .ascii)
            return theJSONText!
        }
        
        return ""
    }
    
    public static func getJsonObject(_ data: Any?) -> AnyObject? {
        if data != nil {
            let jsonData = try? JSONSerialization.data(withJSONObject: data as Any, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            let string = NSString.init(data: jsonData!, encoding: String.Encoding.utf8.rawValue)
            let datas = string?.data(using: String.Encoding.utf8.rawValue)
            let json = try? JSONSerialization.jsonObject(with: datas!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
            return json as AnyObject
        }
        
        return nil
    }
    
}
