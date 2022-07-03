//
// IsuGraph.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the IsuGraph operation.

 - Parameters:
     - input: The validated IsuGraphRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The IsuGraph200ResponseBody object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: badRequestBody, internalServer, unauthorized, unknownResource.
 */
extension IsuConditionOperationsContext {
    public func handleIsuGraph(input: IsuConditionModel.IsuGraphRequest) async throws
    -> IsuConditionModel.IsuGraph200ResponseBody {
        return IsuGraph200ResponseBody.__default
    }
}
