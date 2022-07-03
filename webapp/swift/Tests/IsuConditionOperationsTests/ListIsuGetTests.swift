//
// ListIsuGetTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class ListIsuGetTests: XCTestCase {

    func testListIsuGet() async throws {
        let input = ListIsuGetRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleListIsuGet(input: input)
        XCTAssertEqual(response, ListIsuGet200ResponseBody.__default)
    }
}
