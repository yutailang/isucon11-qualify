//
// IsuConditionGetTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class IsuConditionGetTests: XCTestCase {

    func testIsuConditionGet() async throws {
        let input = IsuConditionGetRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleIsuConditionGet(input: input)
        XCTAssertEqual(response, IsuConditionGet200ResponseBody.__default)
    }
}
