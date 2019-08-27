//
//  EncodingDecodingExtension.swift
//  ground
//
//  Created by TED on 21/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit
import Darwin


///----------------------------------------------------
/// Base64
///----------------------------------------------------
extension String {
    
    // MARK: - Encoding
    var encodeBase64: String {
        return Data(self.utf8).base64EncodedString()
    }
    
    // MARK: - Decoding
    var decodeBase64: String {
        guard let data = Data(base64Encoded: self) else {
            return ""
        }
        return String(data: data, encoding: .utf8) ?? ""
    }
}


///----------------------------------------------------
/// Base62
///----------------------------------------------------
extension String {
    // MARK: - Encoding
    public func encodeBase62(integer: UInt64) -> String {
        return encode(integer: integer, alphabet: base62Alphabet)
    }
    
    func encode(integer: UInt64, alphabet: [String]) -> String {
        let base = UInt64(alphabet.count)
        
        if integer < base {
            return alphabet[Int(integer)]
        }
        return encode(integer: integer / base, alphabet: alphabet) + alphabet[Int(integer % base)]
    }
    
    
    // MARK: - Decoding
    var decodeBase62: UInt64 {
        return decode(string: self, alphabet: base62Alphabet)
    }
    
    func decode(string: String, alphabet: [String]) -> UInt64 {
        let base = Double(alphabet.count)
        var output: UInt64 = 0
        
        for (i, character) in string.reversed().enumerated() {
            guard let index = alphabet.firstIndex(of: String(character)) else { continue }
            let place = UInt64(pow(base, Double(i)))
            output += UInt64(index) * place
        }
        
        return output
    }
}
