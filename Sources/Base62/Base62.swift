//
//  Base62.swift
//  Created by Marcel Voß on 01.05.21.
//

import Foundation

/// An object that provides functionality for converting values to and from [Base62](https://en.wikipedia.org/wiki/Base62).
public struct Base62 {
    
    public enum DecodingError: Error {
        case characterInvalid(Character)
    }
    
    private static let alphabet: [Character] = [
        "0", "1", "2", "3","4" ,"5", "6", "7", "8", "9",
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    ]
    
    private static var base: Int {
        alphabet.count
    }

    /// Base62 encodes an integer value to a string value.
    /// - Parameter value: An integer value that should be encoded.
    /// - Returns: A base62 encoded string.
    public static func encode(_ value: Int) -> String {
        if value < base {
            return String(alphabet[value])
        }
        
        return encode(value / base) + String(alphabet[value % base])
    }
    
    /// Base62 decodes a string value to an integer value.
    /// - Parameter value: A string value that should be decoded.
    /// - Returns: A base62 decoded integer value.
    public static func decode(_ value: String) throws -> Int {
        try value.reversed().enumerated().reduce(into: .zero) { result, next in
            guard let characterIndex = alphabet.firstIndex(of: next.element) else {
                // throw as we can only decode characters that are contained within our alphabet.
                throw DecodingError.characterInvalid(next.element)
            }
            
            // while it doesn't report on an overflow (within a throw), execution
            // should trap if the number is too large to be represented within an Int.
            result += characterIndex * Int(pow(Double(base), Double(next.offset)))
        }
    }
    
}

// MARK: - Extensions
extension Int {
    public func toBase62() -> String {
        Base62.encode(self)
    }
}

extension String {
    public func fromBase62() throws -> Int {
        try Base62.decode(self)
    }
}
