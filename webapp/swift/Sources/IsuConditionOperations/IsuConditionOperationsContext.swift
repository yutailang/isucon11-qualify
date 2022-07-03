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
    let mySQLConnectionPools: EventLoopGroupConnectionPool<MySQLConnectionSource>?

    public init(logger: Logger, eventLoop: EventLoop?) {
        self.logger = logger

        let environment = ProcessInfo.processInfo.environment
        let mySQLConfiguration = MySQLConfiguration(
            hostname: environment["MYSQL_HOST"] ?? "127.0.0.1",
            port: (environment["MYSQL_PORT"].flatMap(Int.init)) ?? 3306,
            username: environment["MYSQL_USER"] ?? "isucon",
            password: environment["MYSQL_PASS"] ?? "isucon",
            database: environment["MYSQL_DBNAME"] ?? "isucondition",
            tlsConfiguration: nil
        )

        self.mySQLConnectionPools = eventLoop.map {
            EventLoopGroupConnectionPool(
                source: MySQLConnectionSource(configuration: mySQLConfiguration),
                on: $0
            )
        }
    }
}
