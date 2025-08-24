import XCTest
@testable import Base404

final class Base404Tests: XCTestCase {
    func testBase404Encoding() {
        let testData = "Hello, Base404 with 汉字!".data(using: .utf8)!
        let encoded = base404Encode(data: testData)
        let decoded = base404Decode(encoded: encoded)
        
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded, testData)
    }
    
    func testBase404GPSEncoding() {
        let latitude: Double = 39.9042
        let longitude: Double = 116.4074
        let encoded = base404EncodeGPS(latitude: latitude, longitude: longitude)
        let decoded = base404DecodeGPS(encoded: encoded)
        
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded?.latitude, latitude)
        XCTAssertEqual(decoded?.longitude, longitude)
    }
    
    static let allTests = [
        ("testBase404Encoding", testBase404Encoding),
        ("testBase404GPSEncoding", testBase404GPSEncoding),
    ]
}