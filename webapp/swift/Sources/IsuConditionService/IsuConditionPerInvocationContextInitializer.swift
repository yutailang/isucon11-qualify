//
// IsuConditionPerInvocationContextInitializer.swift
// IsuConditionService
//

import IsuConditionOperations
import IsuConditionOperationsHTTP1
import SmokeOperationsHTTP1Server
import SmokeAWSCore
import NIO
            
/**
 Initializer for the IsuConditionService.
 */
@main
struct IsuConditionPerInvocationContextInitializer: IsuConditionPerInvocationContextInitializerProtocol {
    // TODO: Add properties to be accessed by the operation handlers

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) async throws {
        CloudwatchStandardErrorLogger.enableLogging()

        // TODO: Add additional application initialization
    }

    /**
     On invocation.
    */
    public func getInvocationContext(invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>)
    -> IsuConditionOperationsContext {
        return IsuConditionOperationsContext(logger: invocationReporting.logger)
    }

    /**
     On application shutdown.
    */
    func onShutdown() async throws {
        
    }
}
