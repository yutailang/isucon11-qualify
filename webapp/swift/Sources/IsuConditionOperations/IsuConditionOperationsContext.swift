//
// IsuConditionOperationsContext.swift
// IsuConditionOperations
//

import Foundation
import Logging
import MySQLKit

/**
 The context to be passed to each of the IsuCondition operations.
 */
public struct IsuConditionOperationsContext {
    let logger: Logger
    // TODO: Add properties to be accessed by the operation handlers
    let mySQLConnectionPools: EventLoopGroupConnectionPool<MySQLConnectionSource>

    public init(logger: Logger, mySQLConnectionPools: EventLoopGroupConnectionPool<MySQLConnectionSource>) {
        self.logger = logger
        self.mySQLConnectionPools = mySQLConnectionPools
    }
}
