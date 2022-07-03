//
// UserMeTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class UserMeTests: XCTestCase {

    func testUserMe() async throws {
        let input = UserMeRequest.__default
        let operationsContext = createOperationsContext()
    
        let response = try await operationsContext.handleUserMe(input: input)
        XCTAssertEqual(response, UserMe200ResponseBody.__default)
    }
}
