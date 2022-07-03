//
// GetIsu.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the GetIsu operation.

 - Parameters:
     - input: The validated GetIsuRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The IsuAttributes object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: internalServer, unauthorized, unknownResource.
 */
extension IsuConditionOperationsContext {
    public func handleGetIsu(input: IsuConditionModel.GetIsuRequest) async throws
    -> IsuConditionModel.IsuAttributes {
        return IsuAttributes.__default
    }
}
