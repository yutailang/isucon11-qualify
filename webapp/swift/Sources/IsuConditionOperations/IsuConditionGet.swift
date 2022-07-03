//
// IsuConditionGet.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the IsuConditionGet operation.

 - Parameters:
     - input: The validated IsuConditionGetRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The IsuConditionGet200ResponseBody object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: badRequestBody, internalServer, unauthorized, unknownResource.
 */
extension IsuConditionOperationsContext {
    public func handleIsuConditionGet(input: IsuConditionModel.IsuConditionGetRequest) async throws
    -> IsuConditionModel.IsuConditionGet200ResponseBody {
        return IsuConditionGet200ResponseBody.__default
    }
}
