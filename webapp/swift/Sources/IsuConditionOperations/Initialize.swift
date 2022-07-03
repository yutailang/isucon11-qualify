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
        return InitializeAttributes.__default
    }
}