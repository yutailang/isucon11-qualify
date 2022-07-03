//
// SignoutTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class SignoutTests: XCTestCase {

    func testSignout() async throws {
        let input = SignoutRequest.__default
        let operationsContext = createOperationsContext()
    
        try await operationsContext.handleSignout(input: input)
    }
}
