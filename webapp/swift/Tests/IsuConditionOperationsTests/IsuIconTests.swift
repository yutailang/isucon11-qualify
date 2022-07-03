//
// IsuIconTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class IsuIconTests: XCTestCase {

    func testIsuIcon() async throws {
        let input = IsuIconRequest.__default
        let operationsContext = createOperationsContext()
    
        try await operationsContext.handleIsuIcon(input: input)
    }
}
