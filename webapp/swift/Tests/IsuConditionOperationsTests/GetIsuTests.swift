//
// GetIsuTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class GetIsuTests: XCTestCase {

    func testGetIsu() async throws {
        let input = GetIsuRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleGetIsu(input: input)
        XCTAssertEqual(response, IsuAttributes.__default)
    }
}
