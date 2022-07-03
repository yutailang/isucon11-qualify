//
// PostConditionPostTests.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel

class PostConditionPostTests: XCTestCase {

    func testPostConditionPost() async throws {
        let input = PostConditionPostRequest.__default
        let operationsContext = createOperationsContext()
    
        try await operationsContext.handlePostConditionPost(input: input)
    }
}
