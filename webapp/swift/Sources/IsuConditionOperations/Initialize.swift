//
// Initialize.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the Initialize operation.

 - Parameters:
     - input: The validated InitializeRequestBody object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The InitializeAttributes object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: badRequestBody, internalServer.
 */
extension IsuConditionOperationsContext {
    public func handleInitialize(input: IsuConditionModel.InitializeRequestBody) async throws
    -> IsuConditionModel.InitializeAttributes {
        do {
            try input.validate()
        } catch {
            throw IsuConditionError.badRequestBody(.init(message: "bad request body"))
        }

        let task = Process()

        task.arguments = ["-c", "../sql/init.sh"]
        task.launchPath = "/bin/bash"
        task.standardInput = nil

        do {
            try task.run()
        } catch {
            throw IsuConditionError.internalServer(.init(message: "exec init.sh error: `\(error)"))
        }

        return InitializeAttributes(language: "Swift")
    }
}
