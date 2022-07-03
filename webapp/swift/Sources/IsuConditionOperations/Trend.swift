//
// Trend.swift
// IsuConditionOperations
//

import Foundation
import IsuConditionModel

/**
 Handler for the Trend operation.

 - Parameters:
     - input: The validated TrendRequest object being passed to this operation.
     - context: The context provided for this operation.
 - Returns: The Trend200ResponseBody object to be passed back from the caller of this operation.
     Will be validated before being returned to caller.
 - Throws: internalServer.
 */
extension IsuConditionOperationsContext {
    public func handleTrend(input: IsuConditionModel.TrendRequest) async throws
    -> IsuConditionModel.Trend200ResponseBody {
        return Trend200ResponseBody.__default
    }
}
