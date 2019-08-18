//
//  EncodableExtension.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension Encodable {
    
    func asDictionary(_ key: String) -> [String: Any] {
        return [key:dictionary as Any]
    }
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    func toString() -> String? {
        return String(describing: self)
    }
}
