//
//  Base62Tests.swift
//  Created by Marcel Voß on 01.05.21.
//

import XCTest
@testable import Base62
 
 final class Base62Tests: XCTestCase {
    
    func testDecodingString() throws {
        XCTAssertEqual(try Base62.decode("LZI"), 82912)
        XCTAssertEqual(try Base62.decode("W7E"), 123456)
        XCTAssertEqual(try Base62.decode("Njd"), 91241)
        XCTAssertEqual(try Base62.decode("5CYa"), 1239912)
        XCTAssertEqual(try Base62.decode("111gaY"), 931311210)
        XCTAssertEqual(try Base62.decode("V0FX"), 7389131)
    }
    
    func testEncodingInteger() {
        XCTAssertEqual(Base62.encode(82912), "LZI")
        XCTAssertEqual(Base62.encode(123456), "W7E")
        XCTAssertEqual(Base62.encode(91241), "Njd")
        XCTAssertEqual(Base62.encode(01239912), "5CYa")
        XCTAssertEqual(Base62.encode(931311210), "111gaY")
        XCTAssertEqual(Base62.encode(7389131), "V0FX")
    }
    
    func testThrowsForInvalidCharacter() {
        XCTAssertThrowsError(try Base62.decode("abc&123"))
        XCTAssertThrowsError(try Base62.decode("abc12.3"))
        XCTAssertThrowsError(try Base62.decode("ab/c123"))
        XCTAssertThrowsError(try Base62.decode("ab#c123"))
    }
    
    // MARK: - Extensions
    func testIntegerExtensionEncoding() {
        let integer = 123456
        XCTAssertEqual(integer.toBase62(), "W7E")
    }
    
    func testStringExtensionDecoding() throws {
        let string = "W7E"
        XCTAssertEqual(try string.fromBase62(), 123456)
    }
    
 }
