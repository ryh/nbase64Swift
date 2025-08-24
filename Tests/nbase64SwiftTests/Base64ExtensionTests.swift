import XCTest
@testable import Base64Extension

final class Base64ExtensionTests: XCTestCase {
    func testBase64EncodingWithEmojiCharset() {
        let testData = "Hello, World!".data(using: .utf8)!
        let encoded = testData.base64EncodedString(with: .emoji)
        let decoded = Data().base64DecodedFromCustomString(encoded, with: .emoji)
        
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded, testData)
    }
    
    func testBase64EncodingWithChineseCharset() {
        let testData = "你好，世界！".data(using: .utf8)!
        let encoded = testData.base64EncodedString(with: .chinese)
        let decoded = Data().base64DecodedFromCustomString(encoded, with: .chinese)
        
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded, testData)
    }
    
    func testStringBase64EncodingWithEmojiCharset() {
        let testString = "Hello, World!"
        let encoded = testString.base64EncodedString(with: .emoji)
        let decoded = String().base64DecodedFromCustomString(encoded!, with: .emoji)
        
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded, testString)
    }
    
    static let allTests = [
        ("testBase64EncodingWithEmojiCharset", testBase64EncodingWithEmojiCharset),
        ("testBase64EncodingWithChineseCharset", testBase64EncodingWithChineseCharset),
        ("testStringBase64EncodingWithEmojiCharset", testStringBase64EncodingWithEmojiCharset),
    ]
}