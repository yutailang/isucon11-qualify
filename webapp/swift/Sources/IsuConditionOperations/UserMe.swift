//
// UserMe.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the UserMe operation.

 - Parameters:
     - input: The validated UserMeRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The UserMe200ResponseBody object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: internalServer, unauthorized.
 */
extension IsuConditionOperationsContext {
    public func handleUserMe(input: IsuConditionModel.UserMeRequest) async throws
    -> IsuConditionModel.UserMe200ResponseBody {
        return UserMe200ResponseBody.__default
    }
}
