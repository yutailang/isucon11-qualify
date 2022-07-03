//
// Signout.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the Signout operation.

 - Parameters:
     - input: The validated SignoutRequestBody object being passed to this operation.
     - context: The context provided for this operation.
 - Throws: internalServer.
 */
extension IsuConditionOperationsContext {
    public func handleSignout(input: IsuConditionModel.SignoutRequestBody) async throws {
    }
}
