//
//  Base62.swift
//  CharisCommerce
//
//  Created by TED on 2018. 5. 28..
//  Copyright © 2018년 madsquare. All rights reserved.
//

import Darwin

let base62Alphabet = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
]

class Base62 {
    
    // MARK: - Encoding
    public static func encode(integer: UInt64) -> String {
        return encode(integer: integer, alphabet: base62Alphabet)
    }
    
    private static func encode(integer: UInt64, alphabet: [String]) -> String {
        let base = UInt64(alphabet.count)
        
        if integer < base {
            return alphabet[Int(integer)]
        }
        return encode(integer: integer / base, alphabet: alphabet) + alphabet[Int(integer % base)]
    }
    

    
    // MARK: - Decoding
    public static func decode(string: String) -> UInt64 {
        return decode(string: string, alphabet: base62Alphabet)
    }

    private static func decode(string: String, alphabet: [String]) -> UInt64 {
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



