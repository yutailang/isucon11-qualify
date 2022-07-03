//
// AuthTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class AuthTests: XCTestCase {

    func testAuth() async throws {
        let input = AuthRequest.__default
        let operationsContext = createOperationsContext()
    
        try await operationsContext.handleAuth(input: input)
    }
}
