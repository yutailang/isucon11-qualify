//
// IsuConditionPerInvocationContextInitializer.swift
// IsuConditionService
//

import IsuConditionOperations
import IsuConditionOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import NIO
import MySQLKit
import Foundation
            
/**
 Initializer for the IsuConditionService.
 */
@main
struct IsuConditionPerInvocationContextInitializer: IsuConditionPerInvocationContextInitializerProtocol {
    // TODO: Add properties to be accessed by the operation handlers

    let mySQLConnectionPools: EventLoopGroupConnectionPool<MySQLConnectionSource>

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) async throws {
        CloudwatchStandardErrorLogger.enableLogging()

        // TODO: Add additional application initialization

        let environment = ProcessInfo.processInfo.environment
        let mySQLConfiguration = MySQLConfiguration(
            hostname: environment["MYSQL_HOST"] ?? "127.0.0.1",
            port: (environment["MYSQL_PORT"].flatMap(Int.init)) ?? 3306,
            username: environment["MYSQL_USER"] ?? "isucon",
            password: environment["MYSQL_PASS"] ?? "isucon",
            database: environment["MYSQL_DBNAME"] ?? "isucondition",
            tlsConfiguration: nil
        )
        self.mySQLConnectionPools = EventLoopGroupConnectionPool(
            source: MySQLConnectionSource(configuration: mySQLConfiguration),
            on: eventLoopGroup
        )

    }

    /**
     On invocation.
    */
    public func getInvocationContext(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
    -> IsuConditionOperationsContext {
        return IsuConditionOperationsContext(
            logger: invocationReporting.logger,
            mySQLConnectionPools: mySQLConnectionPools
        )
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        mySQLConnectionPools.shutdown()
    }
}
