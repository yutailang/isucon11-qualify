import SmokeOperationsHTTP1
import Foundation
import SmokeOperationsHTTP1Server
import AsyncHTTPClient
import NIO
import SmokeHTTP1
import SmokeOperations
import os

public struct MyApplicationContext {
    // let logger: Logger
    // TODO: Add properties to be accessed by the operation handlers

    public init(/*logger: Logger*/) {
        // self.logger = logger
    }
}

struct OperationInput: Codable, Validatable, Equatable {
    // public var name: String

    public func validate() throws {}
}

extension OperationInput: OperationHTTP1InputProtocol {
    public static func compose(
      queryDecodableProvider: () throws -> OperationInput,
      pathDecodableProvider: () throws -> OperationInput,
      bodyDecodableProvider: () throws -> OperationInput,
      headersDecodableProvider: () throws -> OperationInput
    ) throws -> OperationInput {
      try bodyDecodableProvider()
    }

}

struct OperationOutput: Codable, Validatable, Equatable {
    public func validate() throws {}
}

extension OperationOutput: OperationHTTP1OutputProtocol {
    public var bodyEncodable: OperationOutput? { self }
    public var additionalHeadersEncodable: OperationOutput? { nil }
}

extension MyApplicationContext {
    // operationProvider: @escaping ((ContextType) -> ((InputType) throws -> Void)),

    func handleTheOperation(input: OperationInput) throws -> OperationOutput {
        return OperationOutput()
    }
}

public enum MyOperations: String, Hashable, CustomStringConvertible, OperationIdentity {
    case theOperation = "TheOperation"

    public var description: String {
        return rawValue
    }

    public var operationPath: String {
        switch self {
        case .theOperation:
            return "/theOperation"
        }
    }
}

public enum MyApplicationErrors: String, ErrorIdentifiableByDescription {
    public var description: String {
        rawValue
    }

    case unknownResource
}

public extension MyOperations {
    static func addToSmokeServer<SelectorType: SmokeHTTP1HandlerSelector>(selector: inout SelectorType)
            where SelectorType.ContextType == MyApplicationContext,
                  SelectorType.OperationIdentifer == MyOperations {

        let allowedErrorsForTheOperation: [(MyApplicationErrors, Int)] = [(.unknownResource, 404)]
        selector.addHandlerForOperationProvider(.theOperation, httpMethod: .GET,
                                                operationProvider: MyApplicationContext.handleTheOperation,
                                                allowedErrors: allowedErrorsForTheOperation)
    }
}

struct MyPerInvocationContextInitializer: StandardJSONSmokeServerPerInvocationContextInitializer {
    typealias ContextType = MyApplicationContext
    typealias OperationIdentifer = MyOperations

    let serverName = "MyService"
    // specify the operations initializer
    let operationsInitializer: OperationsInitializerType = MyOperations.addToSmokeServer

    /**
     On application startup.
     */
    init(eventLoopGroup: EventLoopGroup) throws {
        // set up any of the application-wide context
    }

    /**
     On invocation.
    */
    public func getInvocationContext(
        invocationReporting: SmokeServerInvocationReporting<SmokeInvocationTraceContext>) -> MyApplicationContext {
        // create an invocation-specific context to be passed to an operation handler
        return MyApplicationContext(/*logger: invocationReporting.logger*/)
    }

    /**
     On application shutdown.
    */
    func onShutdown() throws {
        // shutdown anything before the application closes
    }
}

SmokeHTTP1Server.runAsOperationServer(MyPerInvocationContextInitializer.init)
