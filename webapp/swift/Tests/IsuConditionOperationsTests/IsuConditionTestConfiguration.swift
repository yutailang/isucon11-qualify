//
// IsuConditionTestConfiguration.swift
// IsuConditionOperationsTests
//

import XCTest
@testable import IsuConditionOperations
import IsuConditionModel
import Logging

struct TestVariables {
    static let logger = Logger(label: "IsuConditionTestConfiguration")
}

func createOperationsContext() -> IsuConditionOperationsContext {
    return IsuConditionOperationsContext(logger: TestVariables.logger)
}
