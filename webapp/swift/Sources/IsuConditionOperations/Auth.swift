//
// Auth.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the Auth operation.

 - Parameters:
     - input: The validated AuthRequestBody object being passed to this operation.
     - context: The context provided for this operation.
 - Throws: badRequestBody, forbidden, internalServer.
 */
extension IsuConditionOperationsContext {
    public func handleAuth(input: IsuConditionModel.AuthRequestBody) async throws {
    }
}
