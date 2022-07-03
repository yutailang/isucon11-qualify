//
// ListIsuGet.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the ListIsuGet operation.

 - Parameters:
     - input: The validated ListIsuGetRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The ListIsuGet200ResponseBody object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: internalServer, unauthorized.
 */
extension IsuConditionOperationsContext {
    public func handleListIsuGet(input: IsuConditionModel.ListIsuGetRequest) async throws
    -> IsuConditionModel.ListIsuGet200ResponseBody {
        return ListIsuGet200ResponseBody.__default
    }
}
