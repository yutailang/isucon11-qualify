//
// InitializeTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class InitializeTests: XCTestCase {

    func testInitialize() async throws {
        let input = InitializeRequestBody.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleInitialize(input: input)
        XCTAssertEqual(response, InitializeAttributes.__default)
    }
}
