import XCTest

#if os(Linux)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Base64ExtensionTests.allTests),
        testCase(Base404Tests.allTests)
    ]
}
#endif