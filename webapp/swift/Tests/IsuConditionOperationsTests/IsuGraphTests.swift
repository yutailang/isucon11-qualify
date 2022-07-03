//
// IsuGraphTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class IsuGraphTests: XCTestCase {

    func testIsuGraph() async throws {
        let input = IsuGraphRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleIsuGraph(input: input)
        XCTAssertEqual(response, IsuGraph200ResponseBody.__default)
    }
}
