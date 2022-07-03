//
// TrendTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class TrendTests: XCTestCase {

    func testTrend() async throws {
        let input = TrendRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleTrend(input: input)
        XCTAssertEqual(response, Trend200ResponseBody.__default)
    }
}
