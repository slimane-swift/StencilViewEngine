import XCTest
@testable import StencilViewEngine

class StencilViewEngineTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(StencilViewEngine().text, "Hello, World!")
    }


    static var allTests : [(String, (StencilViewEngineTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
